provider "google" {
 region = "${var.region}"
}

resource "random_id" "id" {
 byte_length = 4
 prefix      = "${var.name}-"
}

resource "google_project" "project" {
 name            = "${var.name}"
 project_id      = "${random_id.id.hex}"
 billing_account = "${var.billing_account}"
 org_id          = "${var.org_id}"
}

resource "google_project_service" "computeservice" {
 project = "${google_project.project.project_id}"
 service = "compute.googleapis.com"
}

resource "google_project_service" "sqlservice" {
 project = "${google_project.project.project_id}"
 service = "sqladmin.googleapis.com"
}
