output "authors_table_name" {
    value = module.table_authors.id
}

output "authors_table_arn" {
    value = module.table_authors.arn
}

output "course_table_name" {
    value = module.table_course.id
}

output "course_table_arn" {
    value = module.table_course.arn
}
