_______________________________________________________________________________
ITERATION 1
_______________________________________________________________________________
User Story 1, Parent Index

For each parent table
As a visitor
When I visit '/parents'
Then I see the name of each parent record in the system

[X] done
_______________________________________________________________________________
User Story 2, Parent Show

As a visitor
When I visit '/parents/:id'
Then I see the parent with that id including the parent's attributes:
data from each column that is on the parent table

[X] done
_______________________________________________________________________________
User Story 3, Child Index

As a visitor
When I visit '/child_table_name'
Then I see each Child in the system including the Child's attributes:

[X] done
_______________________________________________________________________________
User Story 4, Child Show

As a visitor
When I visit '/child_table_name/:id'
Then I see the child with that id including the child's attributes:

[X] done
_______________________________________________________________________________
User Story 5, Parent Children Index

As a visitor
When I visit '/parents/:parent_id/child_table_name'
Then I see each Child that is associated with that Parent with each Child's attributes:

[X] done
_______________________________________________________________________________
User Story 6, Parent Index sorted by Most Recently Created

As a visitor
When I visit the parent index,
I see that records are ordered by most recently created first
And next to each of the records I see when it was created

[X] done
_______________________________________________________________________________
User Story 7, Parent Child Count

As a visitor
When I visit a parent's show page
I see a count of the number of children associated with this parent

[X] done
_______________________________________________________________________________
User Story 8, Child Index Link

As a visitor
When I visit any page on the site
Then I see a link at the top of the page that takes me to the Child Index

[X] done
_______________________________________________________________________________
User Story 9, Parent Index Link

As a visitor
When I visit any page on the site
Then I see a link at the top of the page that takes me to the Parent Index

[X] done
_______________________________________________________________________________
User Story 10, Parent Child Index Link

As a visitor
When I visit a parent show page ('/parents/:id')
Then I see a link to take me to that parent's `child_table_name` page ('/parents/:id/child_table_name')

[X] done
_______________________________________________________________________________
ITERATION 2
_______________________________________________________________________________
User Story 11, Parent Creation

As a visitor
When I visit the Parent Index page
Then I see a link to create a new Parent record, "New Parent"
When I click this link
Then I am taken to '/parents/new' where I  see a form for a new parent record
When I fill out the form with a new parent's attributes:
And I click the button "Create Parent" to submit the form
Then a `POST` request is sent to the '/parents' route,
a new parent record is created,
and I am redirected to the Parent Index page where I see the new Parent displayed.

[X] done
_______________________________________________________________________________
User Story 12, Parent Update

As a visitor
When I visit a parent show page
Then I see a link to update the parent "Update Parent"
When I click the link "Update Parent"
Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
When I fill out the form with updated information
And I click the button to submit the form
Then a `PATCH` request is sent to '/parents/:id',
the parent's info is updated,
and I am redirected to the Parent's Show page where I see the parent's updated info

[X] done
_______________________________________________________________________________
User Story 13, Parent Child Creation

As a visitor
When I visit a Parent Childs Index page
Then I see a link to add a new adoptable child for that parent "Create Child"
When I click the link
I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
When I fill in the form with the child's attributes:
And I click the button "Create Child"
Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
a new child object/row is created for that parent,
and I am redirected to the Parent Childs Index page where I can see the new child listed

[X] done
_______________________________________________________________________________
User Story 14, Child Update

As a visitor
When I visit a Child Show page
Then I see a link to update that Child "Update Child"
When I click the link
I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
When I click the button to submit the form "Update Child"
Then a `PATCH` request is sent to '/child_table_name/:id',
the child's data is updated,
and I am redirected to the Child Show page where I see the Child's updated information

[ ] done
_______________________________________________________________________________
User Story 15, Child Index only shows `true` Records

As a visitor
When I visit the child index
Then I only see records where the boolean column is `true`

[ ] done
_______________________________________________________________________________
User Story 16, Sort Parent's Children in Alphabetical Order by name

As a visitor
When I visit the Parent's children Index Page
Then I see a link to sort children in alphabetical order
When I click on the link
I'm taken back to the Parent's children Index Page where I see all of the parent's children in alphabetical order

[ ] done
_______________________________________________________________________________
User Story 17, Parent Update From Parent Index Page

As a visitor
When I visit the parent index page
Next to every parent, I see a link to edit that parent's info
When I click the link
I should be taken to that parents edit page where I can update its information just like in User Story 12

[ ] done
_______________________________________________________________________________
User Story 18, Child Update From Childs Index Page

As a visitor
When I visit the `child_table_name` index page or a parent `child_table_name` index page
Next to every child, I see a link to edit that child's info
When I click the link
I should be taken to that `child_table_name` edit page where I can update its information just like in User Story 14

[ ] done
_______________________________________________________________________________
ITERATION 3
_______________________________________________________________________________
