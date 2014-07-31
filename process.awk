#! /usr/bin/awk -f
# Adam Cockell
# usage: awk -v developer=devusername -f process.awk sprint

BEGIN {
  RS = "\n"
  FS = "|"
  issue_count = 0
  complete_count = 0
  in_progress_count = 0
  unstarted_count = 0
  complete_time = 0
  time_commitment = 0
}

{
  if((developer == $1)&&(sprint == $3)){
    developer_name=$2
    # for current developer in current sprint
    issue_count++
    time_commitment = time_commitment + $8
    if($7 > 4){
      # ticket completed, resolved, etc
      complete_count++
      complete_time = complete_time + $8
    }
    else {
      # ticket not completed
      if($7 == 3){
        # ticket in progress
        in_progress_count++
      }
      else {
        # ticket in incomplete state
        unstarted_count++
      }
    }
  }
}

END {
  
  #print "Issues: "issue_count
  #print "Total time commitment: "(time_commitment/60/60/24)" days"
  #if(final == 1){
  #  print "Completed: "complete_count
  #  print "In-Progress: "in_progress_count
  #  print "Unstarted: "unstarted_count
  #  print "Time commitment so far: "(complete_time/60/60/24)" days"
  #  print "Percentage of work completed: "(complete_time/time_commitment*100)"%"
  #}

  percent_complete = 0
  if(time_commitment > 0){
    percent_complete=(complete_time/time_commitment*100)
  }
  printf "\n%-30s %-7s %-7s %-7s %-7s %-7s %-7.1f %-10.1f %.1f%%", developer_name, sprint, issue_count, complete_count, in_progress_count, unstarted_count, (time_commitment/60/60/24), (complete_time/60/60/24), percent_complete

}
