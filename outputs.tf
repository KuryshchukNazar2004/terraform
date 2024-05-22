output "authors_table_name" {
    value = module.table_authors.id
}

output "authors_table_arn" {
    value = module.table_authors.arn
}

output "courses_table_name" {
    value = module.table_course.id
}

output "courses_table_arn" {
    value = module.table_course.arn
}
