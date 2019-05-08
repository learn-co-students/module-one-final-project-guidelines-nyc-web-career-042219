Goals:

1. Create User instance and save to database
   - [x] Adam

2. Fix matching of restaurant input with api
   - make sure the correct restaurant is returned
   - verify array fields are being correctly queried
   - [x] Henry

3. Constrain search scope to Manhattan
   - [x] Adam

4. Create Restaurant instance and save to database
   - also create Inspection instance
   - also create Violation instance(s)
   - [ ] Henry

5. Have restaurant profile display correctly
   - [ ] Henry

6. Implement favorite functionality
   - create Favorite instance
   - [ ] Adam

7. Implement favorites list
   - display favorites correctly
   - ability to delete instances
   - [ ] Adam

8. General prettying up

Model:
```
(User)---<[Favs]>---(Restaurant)---<[Inspx]>---(Violtns)

Name	     User.id   Name	           Resto.id   Code
	         Resto.id  Cuisine	       Viol.id    Description
		                 Address	       Date
				                             Grade
```

CLI Flowchart:

```
> PROMPT for username
	user = FINDORCREATE username

> MENU
	1. Search for Restaurant
	2. View my Favorites List
	3. Exit

1. > PROMPT for restaurantname

	FIND in db
		yes
		->

		no
		GETRESTAURANTVIOLATIONS (restaurantname)
		QUERY api
		CREATE restaurant
		->

		-> DISPLAY restaurant.profile
		   > MENU
			1. Add to favorites
			2. Exit to main menu

2. SELECT list from db
	PUTS list
	> MENU
		1. Edit review of restaurant (restaurant)
			A. Add
			B. Edit
			C. Delete
		2. Exit to main menu
```

Helpful Links:
[Collaborating with Git](https://github.com/learn-co-students/collaborating-with-git-crash-course)
[NYC OpenData](https://data.cityofnewyork.us/Health/DOHMH-New-York-City-Restaurant-Inspection-Results/43nn-pn8j/data)

Stretch Goals
- Ability to search by Violation and/or Grade
- Display "Action" field in profile
- Display "Score" field in profile
- Option to show Top Ten Worst restaurant
- Anything to do with zipcode/geo stuff

```
restaurant_inspection_array[0] = Row ID
restaurant_inspection_array[1] = ?
restaurant_inspection_array[2] = ?
restaurant_inspection_array[3] = ?
restaurant_inspection_array[4] = ?
restaurant_inspection_array[5] = ?
restaurant_inspection_array[6] = ?
restaurant_inspection_array[7] = ?
restaurant_inspection_array[8] = CAMIS Number
restaurant_inspection_array[9] = Restaurant Name
restaurant_inspection_array[10] = Borough
restaurant_inspection_array[11] = Address Building No.
restaurant_inspection_array[12] = Address Street
restaurant_inspection_array[13] = Zipcode
restaurant_inspection_array[14] = Phone
restaurant_inspection_array[15] = Cuisine
restaurant_inspection_array[16] = Inspection Date
restaurant_inspection_array[17] = Action
restaurant_inspection_array[18] = Violation Code
restaurant_inspection_array[19] = Violation Desc.
restaurant_inspection_array[20] = Critical Flag
restaurant_inspection_array[21] = Score
restaurant_inspection_array[22] = Grade
restaurant_inspection_array[23] = Grade Date
restaurant_inspection_array[24] = Record Date
restaurant_inspection_array[25] = Inspection Type
restaurant_inspection_array[26] = ?
restaurant_inspection_array[27] = ?
```
