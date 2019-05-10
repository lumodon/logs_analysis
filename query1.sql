create or replace view log_path_counts as
select path, count(path) as num_views
from log
where path like '/article/%'
group by path
order by num_views desc
limit 3;

create or replace view slugs as
select substring(log_path_counts.path from '\/article\/(.*)') as slug, num_views from log_path_counts;

select title, cast(num_views as varchar(64)) || ' views' as views from slugs join articles on articles.slug = slugs.slug;
