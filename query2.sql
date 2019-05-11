WITH y AS (
  WITH x AS (
    select count(path) as num_views, path
    from log
    where log.path like '/article/%'
    group by path
  )
  select SUM(num_views) as total_views, articles.author
  from x
  join articles on
    substring(x.path from '\/article\/(.*)') = articles.slug
  group by articles.author
)
select authors.name, y.total_views
from authors
join y on
  y.author = authors.id
group by authors.name, y.total_views
order by y.total_views desc;
