---
author: Everett Toews
comments: true
date: 2014-01-20 18:29:34+00:00
layout: post
slug: what-developers-need-from-api-method-docs
title: What Developers Need From API Method Docs
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

<table class="table table-striped table-hover">
  <thead>
    <tr>
      <th>Parameter</th>
      <th>Position</th>
      <th>Required</th>
      <th>Type</th>
      <th>Range</th>
      <th>Default</th>
      <th>Notes</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>name</th>
      <th>book.name</th>
      <th>Yes</th>
      <th>String</th>
      <th>1 to 256 chars</th>
      <th>N/A</th>
      <th>The name of the book</th>
    </tr>
    <tr>
      <th>pages</th>
      <th>book.pages</th>
      <th>Yes</th>
      <th>Integer</th>
      <th>1 to 1,000,000</th>
      <th>N/A</th>
      <th>The number of pages in the book</th>
    </tr>
    <tr>
      <th>authors</th>
      <th>book.authors</th>
      <th>Yes</th>
      <th>Array of Strings</th>
      <th>1 to 256 chars for each author</th>
      <th>N/A</th>
      <th>Alphabetical listing of authors of the book</th>
    </tr>
  </tbody>
</table>

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
