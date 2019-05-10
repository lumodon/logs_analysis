select authors.name, count(path) || ' views' as num_views
from log
join articles on
  substring(log.path from '\/article\/(.*)') = articles.slug
join authors on
  articles.author = authors.id
where log.path like '/article/%'
group by authors.name
order by num_views asc;
