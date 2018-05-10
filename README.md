# Rails Project - README


### Website: http://www.vimport.herokuapp.com

### Github repo: https://github.com/lukeylunchbox/vimport

## Vimport - Virtual Container Share


### The Problem

As it currently stands, no individual or small business can place an order from a Chinese factory and receive real wholesale prices.

Customers can order non-FCL (full container load) from online agents in China and are charged a massive premium. 
Most vendors do not communicate in English, and employing an English speaking agent just means you will pay too much.

The paperwork and legal knowledge required to import products from China is enough of a hurdle to put off most small businesses and sole traders from doing so.

Added to the confusion is the language barrier between business outside of China. Most factories do not directly communicate in English, and consequently agents and translators must be employed. Agents that don't take advantage of uninformed foreign customers are few and far between. Take that from first-hand experience.


### The Solution

Vimport connects local customers and businesses that individually want to import non FCL orders directly from factories in China and pay wholesale, trade prices.
It works by consolidating large amounts smaller orders from a group of customers found through crowd-sourcing into full-container loads.

Vimport simplifies importing by consolidating all tarrifs, taxes and freight costs into one initial payment. 

All customers involved in the container import split the total order cost by the quantity they require, thereby receiving complete wholesale prices regardless of their order quantity. 

Once the full order quantity has been met with orders, the order is placed by Vimport directly to the factory.
This means our customers do not need import licences, nor do they need to worry about customs declarations, tax calculations and relentless language barriers.

## Moodboard

I love all things maritime, so finding inspiration was easy. I decided I would use a multi-colour scheme inspired by shipping containers. 
I am particularly fond of birds-eye views of shipping yards and cargo ships. Since this app is based around container sharing, I chose one of these images for the landing page.

![Landing page image](/app/assets/images/cargo-ship.jpg)


## The Design

As you can see from my design below, I really wanted to go with a maritime theme. 
I created a background image by gluing a photo of the ocean and a photo of some dock cranes together. 
This image was reused in most pages of the app.

![Moodboard](/app/assets/images/figma.png)

I also wanted the site to be simple. That's why I chose icons for primary navigation.
I chose not to put the category title under the icons because I believe this defeats the purpose of having icons in the first place. Although this could potentially cause some confusion to users who cannot recognise a category icon, after the first visit to the site they will be fine. I also put the title as a hover attribute, in case users need help identifying a category or if a screen reader needs to be used for visually impaired users. 

I absolutely loved the birds-eye view of a cargo ship I found online. However after I resized the browser to desktop view, the image didn't suit. 
Instead of abandoning it, I created a media query to render this image on a phone-sized resolution, but render a larger image on any screen larger. 


### User Stories

![Trello](/app/assets/images/trello.png)

### User Journey

![User Journey](/app/assets/images/user-map.png)

### ERD

Initially, my database design contained 12 tables. However, this was reduced through logic to the final design of 7 tables.
For example, I decided to only have one Profiles table. This would contain both my users' shipping address and residential address. A small action like this simplified the app significantly. 

The functionality of the app is as follows;

A new user visits the home page. Any action following will ask them to register.

Registration requires an email address and password. 

They may progress further from here without filling out a profile (although their profile is created automatically once they register). 

Once a user finds a proposal they want to place an order against, the system will require they complete their profile first.

After an order is placed and payment was successful, the user receives an order confirmation email outlining the purchase details. 

![ERD](/app/assets/images/erd.png)

### Required Gems 
* Devise - user authentication
* Rspec-rails - testing
* Dotenv - securing variables
* Pundit - user authorisation
* Shrine - photo uploads
* Stripe - payment
* Mail-gun - mailer
* Country-select

### Future Development 

With more time available, I'd like to create the proposed live update messaging service to allow proposers to communicate with users and vice versa. 

I'd also like to extend the confirmation emails to include when an order is dispatched from China, as well as live tracking of the container from Marinetraffic.com's API service.