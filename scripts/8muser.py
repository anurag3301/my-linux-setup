#!/bin/python

import os
from multiprocessing.dummy import Pool
from queue import Queue
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from bs4 import BeautifulSoup
from threading import Thread
import urllib.request
import requests 
import shutil

options = Options()
options.headless = True
chrome_driver_path = r"/home/anurag/dl/chromedriver"
base_url = "https://www.8muses.com"

def fetch_image_url(url,filename,download_location):
    if os.path.exists(os.path.join(download_location,str(filename)+".png")):
        print(f"Filename Exists, skipping")
        return
    driver = webdriver.Chrome(chrome_driver_path, chrome_options=options)
    driver.get(url)
    page = driver.page_source
    soup = BeautifulSoup(page,"lxml")
    image_url = "http:"+soup.find("img",{"class":"image"})['src']
    download_image(image_url,filename,download_location)

def download_image(image_url,filename,download_location):
    r = requests.get(image_url,stream=True, headers={'User-agent': 'Mozilla/5.0'})
    if r.status_code == 200:
        with open(os.path.join(download_location,str(filename)+".png"), 'wb') as f:
            r.raw.decode_content = True
            shutil.copyfileobj(r.raw, f)
    print("Downloaded page {pagenumber}".format(pagenumber=filename))


if __name__=="__main__":
    print("Album Url : ")
    album_url = input()

    download_location = os.path.join(os.environ['HOME'], ".com")
    if not os.path.exists(download_location):
        os.mkdir(download_location)

    driver = webdriver.Chrome(chrome_driver_path, chrome_options=options)
    print("Loading Comic...")
    driver.get(album_url)
    album_html = driver.page_source
    print("Comic successfully loaded")
    soup = BeautifulSoup(album_html,"lxml")
    comic_name = soup.find("title").text.split("|")[0].strip()
    download_location = os.path.join(download_location,comic_name)
    if not os.path.exists(download_location):
        os.mkdir(download_location)
    print("Finding comic's pages")
    images = soup.find_all("a",{"class":"c-tile t-hover"})
    page_urls = []
    pages = []
    threads = []
    for image in images:
        page_urls.append(base_url + image['href'])
    print("Found {} pages".format(len(page_urls)))
    for i in  range(len(page_urls)):
            pages.append((page_urls[i],i,download_location))
    p = Pool(3)  # 3 threads in the pool
    p.starmap(fetch_image_url,pages)
    p.close()
    p.join()
    driver.quit()
    print ("DONE ! Happy Reading ")
