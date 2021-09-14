# Fashion Shop API (Back-End)

 Back-end API application providing database and endpoints for intended CRUD operations.

### Active Endpoints

#### Items

- `GET /items` - Get all items

- `GET /items/:id` - Get an item by id

- `POST /items` - Create new item
   
   Query params:
   - `title` - Item title ( `minimum length`: 3 )
   - `price` - Item price
   - `image` - Item url
   - `img_public_id` - Public id of image located in Cloudinary
   - `category` - category of item  

- `PUT /items/:id` - Update existing items
   
   Query params:
   - `title` - Item title ( `minimum length`: 3 )
   - `price` - Item price
   - `image` - Item url
   - `img_public_id` - Public id of image located in Cloudinary
   - `category` - category of item

- `DELETE /items/:id` - Delete item with given id

#### Categories

- `GET /categories` - Get all categories

- `GET /categories/:id` - Get category by id

- `POST /categories` - Create new category
   
   Query params:
   - `name` - Category name ( `minimum length`: 2 )

#### Users

- `GET /users/:id` - Get user by id

- `POST /users` - Create new user
  
   Query params:
   - `name` - User name ( `minimum length`: 3 )
   - `admin_level` - Admin level of user( `default`: 0 )

- `POST /users/:id/favourites` - Add item to favourite list of user

   Query params:
   - `item_id` - Item id

- `DELETE /users/:id/favourites` - Delete item from favourite list of user

   Query params:
   - `item_id` - Item id


## Built With

- Rails 6
- Cloudinary Rails SDK

## Setup

  If you want to try this application locally, follow the steps below:

  1. Clone the project using `git clone https://github.com/8Bts/fashion-shop-api.git` command.

  2. run `cd fashion-shop-api`.

  3. run `bundle install`.

  4. run `rails server`.

## Test

  To run tests for the application try the `rspec` command and ensure that you are in the project folder before running it. 

## Author

👤 **Rashid Mammadli**

- Github: [8Bts](https://github.com/8Bts)
- Twitter: [@Rasheed49705929](https://twitter.com/Rasheed49705929)
- Linkedin: [Rashid Mammadli](https://www.linkedin.com/in/rashidmammadli/)
- Email: mcmizze@yahoo.com


## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the <a href="https://github.com/8Bts/fashion-shop-api/issues" target="_blank">issues page</a>.

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- [Microverse - Web Development School](https://www.microverse.org/)