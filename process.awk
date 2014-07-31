#! /usr/bin/awk -f
# usage: awk -f process.awk sprint

BEGIN {
  RS = "\n"
  FS = "|"
  name_count = 0
  sprint_count = 0
}

{
  current_name = $1
  current_sprint = $3
 
  if(current_name != name[name_count - 1]){
    name[name_count] = current_name
    name_count++
    print current_name
  }
  else {
    if(current_sprint != sprint[sprint_count - 1]){
      sprint[sprint_count] = current_sprint
      sprint_count++
      print current_sprint
    }
    else {
      # record and print user data
    }
  }
}

END {
  print "Done."
  print name_count
  print sprint_count
}
