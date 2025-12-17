-- Count how many publishers are in each state.
select PubState, count(PublisherName) as PublisherAmount
from Publisher
group by PubState;

-- Which Publishers are located on the Avenue of the Americas in NYC?
select PublisherName
from Publisher
where PubAddress like '%Avenue Of the Americas%';

-- Sum the price of every book to see the cost of the entire database
select sum(Price) as 'Total Store Price'
from Title;

-- Show books that are part of a series and order by book name
select BookName,SeriesName,BookID
from Title
where SeriesName is not null
order by BookName;

-- display customers that are in Canada. 
select FirstName,LastName,Email, Address,City,State,Country
from Customer
where Country='Canada';

-- What authors published which books?
select Author.FirstName,Author.LastName,BookName,PageCount,SeriesName
from Author,AuthorTitle,Title
where AuthorTitle.BookID=Title.BookID and AuthorTitle.AuthorID=Author.AuthorID;

-- Which authors belong to which publishers?
select Author.FirstName, Author.LastName, PublisherName
from Author,Publisher
where Author.PublisherID=Publisher.PublisherID;

-- Which books are customers ordering?
select FirstName,LastName,OrderID,OrderDate, BookName, Title.BookID
from Customer,Orders,Title
where Customer.CustomerID=Orders.CustomerID and Orders.BookID=Title.BookID
order by LastName;

-- What genres are the books? Order by the genre name.
select BookName, BookID, GenreName
from Title,Genre
where Title.GenreID=Genre.GenreID
order by GenreName;

-- Display every customers whether they have an order or not
select FirstName,LastName,Address,City,State,Country,OrderID
from Orders right join Customer
on Orders.CustomerID=Customer.CustomerID
order by LastName;