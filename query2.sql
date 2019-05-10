WITH x AS (
select count(path) || ' views' as num_views, path
from log
where log.path like '/article/%'
group by path
)
select authors.name, num_views
from x
join articles on
  substring(x.path from '\/article\/(.*)') = articles.slug
join authors on
  articles.author = authors.id
group by authors.name, num_views
order by num_views asc;
