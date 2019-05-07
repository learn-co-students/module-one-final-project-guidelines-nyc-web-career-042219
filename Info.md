
1. Create User instance and save to database
2. Fix matching of restaurant input with api
   - make sure the correct restaurant is returned
   - verify array fields are being correctly queried
3. Constrain search scope to Manhattan
4. Create Restaurant instance and save to database
   - also create Inspection instance
   - also create Violation instance(s)
5. Have restaurant profile display correctly
6. Implement favorite functionality
   - create Favorite instance
7. Implement favorites list
   - display favorites correctly
   - ability to delete instances 



Model:

(User)---<[Favs]>---(Restaurant)---<[Inspx]>---(Violtns)

Name	     User.id   Name	           Resto.id   Code
	         Resto.id  Cuisine	       Viol.id    Description
		                 Address	       Date
				                             Grade

CLI Flowchart:

1. display welcome message
2. prompt user for username [_____]
   - create user instance + add to db
   - exit
3. main menu prompt [______]
   - search for resto -> go to 4
   - view my favorites -> go to 5
   - exit
4. prompt user for restaurant name [______]
   - display restaurant profile
     - search api for match
     - create resto, insp, and viol instances + save
     - construct profile
   - prompt user to add favorite [ Y/N ]
     - Y -> create fav and add to db
     - N -> go to 3
5. view favorites
   - generate list of fav restaurants [______]
     - delete (by name? or number)
     - exit -> go to 3


https://github.com/learn-co-students/collaborating-with-git-crash-course

Stretch Goals
- Display "Action" field in profile
- Display "Score" field in profile
- Option to show Top Ten Worst restaurant


 # restaurant_inspection_array[0] = Row ID
 # restaurant_inspection_array[1] = ?
 # restaurant_inspection_array[2] = ?
 # restaurant_inspection_array[3] = ?
 # restaurant_inspection_array[4] = ?
 # restaurant_inspection_array[5] = ?
 # restaurant_inspection_array[6] = ?
 # restaurant_inspection_array[7] = ?
 # restaurant_inspection_array[8] = CAMIS Number
 # restaurant_inspection_array[9] = Restaurant Name
 # restaurant_inspection_array[10] = Borough
 # restaurant_inspection_array[11] = Address Building No.
 # restaurant_inspection_array[12] = Address Street
 # restaurant_inspection_array[13] = Zipcode
 # restaurant_inspection_array[14] = Phone
 # restaurant_inspection_array[15] = Cuisine
 # restaurant_inspection_array[16] = Inspection Date
 # restaurant_inspection_array[17] = Action
 # restaurant_inspection_array[18] = Violation Code
 # restaurant_inspection_array[19] = Violation Desc.
 # restaurant_inspection_array[20] = Critical Flag
 # restaurant_inspection_array[21] = Score
 # restaurant_inspection_array[22] = Grade
 # restaurant_inspection_array[23] = Grade Date
 # restaurant_inspection_array[24] = Record Date
 # restaurant_inspection_array[25] = Inspection Type
 # restaurant_inspection_array[26] = ?
 # restaurant_inspection_array[27] = ?
