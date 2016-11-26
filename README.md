# README

Public API with pagination and version on subdomain api.example.com and sample client page.

---

### Setup

1. `git clone`
2. `rails db:create`
3. `rails db:migrate`
4. `rails db:seed`
5. `rails s`

---

### Run tests
`rails test`

---

### Dependencies/tools/gems used:
* PostgreSQL
* Rails 5
* AngularJS 1
* Twitter Bootstrap 4
* active_model_serializers
* will_paginate
* faker

---

### Specifications
Follows main specifications of [json:api](http://jsonapi.org/)

---

### Endpoints
* `/featured_attendees`

  **Parameters:**

  | Name         | Type     | Description    |
  |:-------------|:---------|:---------------|
  | page[number] | integer  | Page number    |
  | page[size]   | integer  | Items per page |

  **Example:**

  `http://api.lvh.me:3000/featured_attendees?page[number]=1&page[size]2`

  ```json
  {
    "data": [
      {
        "id": "876",
        "type": "featured-attendees",
        "attributes": {
          "first-name": "Rhiannon",
          "last-name": "Mayer",
          "title": "Internal Group Coordinator",
          "company": "Reinger, Marks and Lockman",
          "country": "Turkey",
          "interests": "{Investment,ECommerce,Music,Gaming}",
          "thumbnail-url": "https://s3-eu-west-1.amazonaws.com/summitid/people/14093/medium/john_cc.png"
        }
      },
      {
        "id": "2171",
        "type": "featured-attendees",
        "attributes": {
          "first-name": "Consuelo",
          "last-name": "Kemmer",
          "title": "Corporate Implementation Producer",
          "company": "Rolfson-Parisian",
          "country": "Japan",
          "interests": "{Gaming,Social}",
          "thumbnail-url": "https://s3-eu-west-1.amazonaws.com/summitid/people/14093/medium/john_cc.png"
        }
      }
    ],
    "links": {
      "self": "http://api.lvh.me:3000/featured_attendees?page%5Bnumber%5D=1&page%5Bsize%5D=2",
      "next": "http://api.lvh.me:3000/featured_attendees?page%5Bnumber%5D=2&page%5Bsize%5D=2",
      "last": "http://api.lvh.me:3000/featured_attendees?page%5Bnumber%5D=1203&page%5Bsize%5D=2"
    },
    "meta": {
      "current-page": 1,
      "next-page": 2,
      "prev-page": null,
      "total-pages": 1203,
      "total-count": 2405
    }
  }

  ```
  Response includes meta information about pagination and links to first, previous, next and last pages.

* `/featured_attendees/:id`

  **Example:**

  `http://api.lvh.me:3000/featured_attendees/1`

  ```json
  {
    "data": {
      "id": "1",
      "type": "featured-attendees",
      "attributes": {
        "first-name": "Delilah",
        "last-name": "Lemke",
        "title": "Direct Metrics Orchestrator",
        "company": "Mante, Corwin and Ernser",
        "country": "Canada",
        "interests": "{Enterprise,Fintech,Gaming,Sports,Travel,ECommerce}",
        "bio": "Quia rerum expedita vel atque.",
        "image-url": "https://s3-eu-west-1.amazonaws.com/summitid/people/14093/large/john_cc.png"
      }
    }
  }
  ```

---

### Versioning
A specific version can be requested using the `Accept` header as follows.

`application/vnd.websummit.v1+json`
