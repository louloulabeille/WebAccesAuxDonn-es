select c.CategoryName, p.ProductID, p.ProductName,p.UnitPrice from Products as p inner join Categories as c on p.CategoryID = c.CategoryID
order by c.CategoryName