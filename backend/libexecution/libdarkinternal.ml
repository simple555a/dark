open Core_kernel
open Lib
open Types.RuntimeT

let fns : Lib.shortfn list =
  [ { pns = ["DarkInternal::checkAccess"]
    ; ins = []
    ; p = []
    ; r = TNull
    ; d = "TODO"
    ; f = NotClientAvailable
    ; ps = false
    ; dep = false }
  ; { pns = ["DarkInternal::endUsers"]
    ; ins = []
    ; p = []
    ; r = TList
    ; d =
        "Return a list of all user email addresses for non-admins and not in
@darklang.com or @example.com"
    ; f = NotClientAvailable
    ; ps = false
    ; dep = false }
  ; { pns = ["DarkInternal::checkAllCanvases"]
    ; ins = []
    ; p = []
    ; r = TNull
    ; d = "TODO"
    ; f = NotClientAvailable
    ; ps = false
    ; dep = true }
  ; { pns = ["DarkInternal::migrateAllCanvases"]
    ; ins = []
    ; p = []
    ; r = TNull
    ; d = "TODO"
    ; f = NotClientAvailable
    ; ps = false
    ; dep = false }
  ; { pns = ["DarkInternal::cleanupOldTraces"]
    ; ins = []
    ; p = []
    ; r = TNull
    ; d = "Deprecated, use v1"
    ; f = NotClientAvailable
    ; ps = false
    ; dep = true }
  ; { pns = ["DarkInternal::cleanupOldTraces_v1"]
    ; ins = []
    ; p = []
    ; r = TFloat
    ; d = "Cleanup the old traces from a canvas"
    ; f = NotClientAvailable
    ; ps = false
    ; dep = false }
  ; { pns = ["DarkInternal::checkCanvas"]
    ; ins = []
    ; p = [par "host" TStr]
    ; r = TBool
    ; d = "TODO"
    ; f = NotClientAvailable
    ; ps = false
    ; dep = false }
  ; { pns = ["DarkInternal::upsertUser"]
    ; ins = []
    ; p = [par "username" TStr; par "email" TStr; par "name" TStr]
    ; r = TStr
    ; d =
        "Add a user. Returns a password for the user, which was randomly generated. Usernames are unique: if you add the same username multiple times, it will overwrite the old settings (useful for changing password)."
    ; f = NotClientAvailable
    ; ps = false
    ; dep = false }
  ; { pns = ["DarkInternal::getUser"]
    ; ins = []
    ; p = [par "username" TStr]
    ; r = TOption
    ; d = "Return a user for the username. Does not include passwords."
    ; f = NotClientAvailable
    ; ps = false
    ; dep = true }
  ; { pns = ["DarkInternal::getUser_v1"]
    ; ins = []
    ; p = [par "username" TStr]
    ; r = TOption
    ; d = "Return a user for the username. Does not include passwords."
    ; f = NotClientAvailable
    ; ps = false
    ; dep = false }
  ; { pns = ["DarkInternal::setAdmin"]
    ; ins = []
    ; p = [par "username" TStr; par "admin" TBool]
    ; r = TNull
    ; d = "Set whether a user is an admin. Returns null."
    ; f = NotClientAvailable
    ; ps = false
    ; dep = false }
  ; { pns = ["DarkInternal::getUsers"]
    ; ins = []
    ; p = []
    ; r = TList
    ; d = "Return a list of username of all the accounts in Dark."
    ; f = NotClientAvailable
    ; ps = false
    ; dep = false }
  ; { pns = ["DarkInternal::getAllCanvases"]
    ; ins = []
    ; p = []
    ; r = TList
    ; d = "TODO"
    ; f = NotClientAvailable
    ; ps = false
    ; dep = false }
  ; { pns = ["DarkInternal::schema"]
    ; ins = []
    ; p = [par "host" TStr; par "dbid" TStr]
    ; r = TObj
    ; d = "Return a schema for the db"
    ; f = NotClientAvailable
    ; ps = false
    ; dep = false }
  ; { pns = ["DarkInternal::canvasAsText"]
    ; ins = []
    ; p = [par "host" TStr]
    ; r = TStr
    ; d = "TODO"
    ; f = NotClientAvailable
    ; ps = false
    ; dep = false }
  ; { pns = ["DarkInternal::handlers"]
    ; ins = []
    ; p = [par "host" TStr]
    ; r = TList
    ; d = "Returns a list of toplevel ids of handlers in `host`"
    ; f = NotClientAvailable
    ; ps = false
    ; dep = false }
  ; { pns = ["DarkInternal::canLoadTraces"]
    ; ins = []
    ; p = [par "host" TStr; par "tlid" TStr]
    ; r = TBool
    ; d =
        "Takes a `host` and a `tlid` and returns true iff. we can load+parse traces for the handler identified by `tlid`, and false otherwise"
    ; f = NotClientAvailable
    ; ps = false
    ; dep = false }
  ; { pns = ["DarkInternal::getCORSSetting"]
    ; ins = []
    ; p = [par "canvas" TStr]
    ; r = TOption
    ; d =
        "Given the full canvas name (including the username), get that canvas' global CORS setting."
    ; f = NotClientAvailable
    ; ps = false
    ; dep = false }
  ; { pns = ["DarkInternal::setCORSSetting"]
    ; ins = []
    ; p = [par "canvas" TStr; par "origins" TOption]
    ; r = TResult
    ; d =
        "Given the full canvas name (including the username) and an Option of either \"*\" or a list of string origins, set that value to that canvas' global CORS setting, so that it will be used in Access-Control-Allow-Origin response headers. Returns true if it worked and false if it didn't (likely meaning: the Dark value you passed in was invalid)."
    ; f = NotClientAvailable
    ; ps = false
    ; dep = false }
  ; { pns = ["DarkInternal::dbs"]
    ; ins = []
    ; p = [par "host" TStr]
    ; r = TList
    ; d = "Returns a list of toplevel ids of dbs in `host`"
    ; f = NotClientAvailable
    ; ps = false
    ; dep = false }
  ; { pns = ["DarkInternal::oplistInfo"]
    ; ins = []
    ; p = [par "host" TStr; par "tlid" TStr]
    ; r = TObj
    ; d =
        "Returns the information from the toplevel_oplists table for the (host, tlid)"
    ; f = NotClientAvailable
    ; ps = false
    ; dep = false }
  ; { pns = ["DarkInternal::storedEvents"]
    ; ins = []
    ; p = [par "host" TStr; par "tlid" TStr]
    ; r = TOption
    ; d =
        "Returns Just most recent stored events for the tlid if it is a handleror Nothing if it is not"
    ; f = NotClientAvailable
    ; ps = false
    ; dep = false }
  ; { pns = ["DarkInternal::pushStrollerEvent"]
    ; ins = []
    ; p = [par "canvas_id" TStr; par "event" TStr; par "payload" TObj]
    ; r = TResult
    ; d = "Pushes an event to Stroller"
    ; f = NotClientAvailable
    ; ps = false
    ; dep = false } ]
