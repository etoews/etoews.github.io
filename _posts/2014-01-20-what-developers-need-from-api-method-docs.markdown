---
author: evtoews
comments: true
date: 2014-01-20 18:29:34+00:00
layout: post
slug: what-developers-need-from-api-method-docs
title: What Developers Need From API Method Docs
wordpress_id: 513
categories:
- documentation
---

**TL;DR** Developers need zero ambiguity from API documentation.

I am looking for 6 sections when I'm reading API method documentation: the call, prose, parameters, status codes, error codes and examples.


## The Call


The HTTP method and path.

e.g. `POST https://api.example.com/book`


## Prose


Keep it simple and succinct. The less words you use the better. Writing lengthy descriptions about what the API call does has a way of letting ambiguity sneak in.


## Parameters


I need up to 5 tables. Some tables might not be necessary, depending on the method and how it gets called.



	
  * 1 detailing the parameters for the query

	
  * 1 detailing the parameters for the request headers

	
  * 1 detailing the parameters for the request body

	
  * 1 detailing the parameters for the response headers

	
  * 1 detailing the parameters for the response body


The tables are made up of the following columns.

	
  * parameter

	
  * position (if it's body content)

	
  * required

	
  * data type

	
  * valid range

	
  * default

	
  * notes


e.g.







Parameter
Position
Required
Data Type
Valid Range
Default
Notes





name


book.name


Yes


String


1 to 256 chars


N/A


The name of the book






pages


book.pages


Yes


Integer


1 to 1,000,000


N/A


The number of pages in the book






authors


book.authors


Yes


Array of Strings


1 to 256 chars for each author


N/A


Alphabetical listing of authors of the book






## Status Codes


Detail all possible non-error status codes that can be returned by the method. If this particular status code is accompanied by content in the response body, it should be detailed in a table as above.

e.g. 201 The book was created.


## Error Codes


Detail all possible error status codes that can be returned by the method. Actionable hints on how to resolve errors are always appreciated. If this particular status code is accompanied by content in the response body, it should be detailed in a table as above.

e.g. 400 The book was not created.


## Examples


As complete an example as possible of the request and response.

e.g.

    
    { "book" : {
      "title": "How to Write API Method Docs",
      "pages": 200,
      "authors": ["sarah", "steve"]
      }
    }


Note: I realize that the "book" level isn't really necessary here. I'm just using it to illustrate the use of the position column in the table above.


## Coda


This is what we need to code to your API. Every bit of ambiguity you remove from your documentation will make us love your API more and more.
