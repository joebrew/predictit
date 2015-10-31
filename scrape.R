library(rvest)
library(XML)
# Favorite longshot bias

#####
# BETFAIR
#####
# https://developer.betfair.com/

#####
# SMARKETS
#####
# http://smarkets.s3.amazonaws.com/oddsfeed.xml

#####
# PREDICT WISE
#####
# http://www.predictwise.com/

poll_page <- 'http://www.predictwise.com/politics/2016RepNomination'
poll_html <- read_html(poll_page)

# Get links to html tables
table_urls <- 
  poll_html %>%
  html_nodes('div iframe') %>%
  html_attr('src')

# Go to link and read table
table_url <- table_urls[2]
x <- table_url %>%
  read_html() %>%
  html_nodes('.pw_table') 

readHTMLTable(htmlParse(table_url))
srts<-htmlParse(table_url)
class(srts)

srts.table<- readHTMLTable(srts,stringsAsFactors = FALSE)

#####
# HUFFPOST POLLSTER API
#####
# http://elections.huffingtonpost.com/pollster/api

#####
# PREDICT IT
#####
library(rvest)

# Start session
predictit_url <- 'https://predictit.org'
s <- html_session('https://predictit.org')
session <- html_session(predictit_url)
form <- html_form(session)[[4]]
form <- set_values(form, Email = "joebrew@gmail.com")
form <- set_values(form, Password = 'xxxx')

# Log in 
session2 <- submit_form(session, form)

# See main page
main_page <- read_html('https://www.predictit.org/Browse/Featured')

# Ticker
ticker <- 
  read_html('https://www.predictit.org/Browse/NewArrivals') %>%
  html_nodes(xpath = '//b | //span') %>%
  html_text()

# Polls
polls <- 
  main_page %>%
  html_nodes('a h3') %>%
  html_text()

# Poll links
poll_links <- 
  main_page %>%
  html_nodes('div img') 
poll_links[grepl('Markets', poll_links)][1] 
# Get links from polls
session2

# Loop through polls going to each link
for (p in polls)

# vals

  main_page %>%
  html_nodes('._20150803_info-1') 

# Jump to log in
nodes <- read_html('https://www.predictit.org/') %>%
  html_nodes('tr') %>%
  html_text() %>%
  follow_link()

