doctype html
html
  head
    title Amber Backend using Amber
    meta charset="utf-8"
    meta http-equiv="X-UA-Compatible" content="IE=edge"
    meta name="viewport" content="width=device-width, initial-scale=1"
    link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
    link rel="stylesheet" href="/dist/main.bundle.css"

  body
    div.masthead
      div.container
        nav.nav
          == render(partial: "layouts/_nav.slang")
    div.container
      div.row
        - flash.each do |key, value|
          div class="alert alert-#{key}"
            p = flash[key]
      div.row
        div.col-sm-12.main
          == content

    script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"
    script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
    script src="/dist/main.bundle.js"
