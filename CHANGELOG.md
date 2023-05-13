# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

# Version 1.2

The website finally has a working tag system and its somewhat presentable now....

## Added:

- A working tag system and a page to display all tags.
- A sample `appinsights.html` to be used in the future with Azure AppInsights.

## Changed:

- Updated bootstrap to 5.3.0-a3
- Revesed the order of posts on the homepage and the list page.
- Corrected the date on the first post to the time the website was published.
- Minor corrections to CICD.
- Moved footer to partials.
- Moved `<header>` and `<head>` tags to their respective partials.
- Formatting where applicable.

## Removed:

- Removed the `about.md` page and move it to the front page.

# Version 1.1

## Added:

- Added basic infrastructure with Terraform and Azure Static Web Apps
- Added CICD for both the website and infrastructure.

## Changed:

- Minor corrections to first post.
- Import a backup font.

# Version 1.0

## Added:

- Initial commit.
- Developed the website from ground up using Bootstrap.
- Added .gitignore with relevant tags
- First trial post.
- Converted config.toml to config.yml to make it look respectable.