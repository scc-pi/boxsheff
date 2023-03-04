# Connect to OSCAR database via ODBC
#' @export
oscar_connect = function () {
  oscar_con <- DBI::dbConnect(
    odbc::odbc(),
    Driver = "Oracle in OraClient12Home1",
    Dbq = "SCPRFLVE",
    UID = if (Sys.getenv("oscar_userid") == "") {
      rstudioapi::askForPassword("OSCAR User ID")
    } else {
      Sys.getenv("oscar_userid")
    },
    PWD = if (Sys.getenv("oscar_pwd") == "") {
      rstudioapi::askForPassword("OSCAR Password")
    } else {
      Sys.getenv("oscar_pwd")
    },
    timeout = 10
  )
}