#!/bin/bash

reward="🍓"
to_win=10

main() {
  echo "What is your name?"
  read name
  clear
  print "👋 Hello, $name! Let's practice typing!"

  score=0

  while [[ $score -lt $to_win ]]; do
    char=$(base64 < /dev/urandom | tr -d 'O0Il1+/' | head -c 1)
    answer=""

    while [[ $answer != $char ]]; do
      echo "Score: $(reward_score)"
      echo "Type $char"
      read temp
      answer="$temp"
      if [[ $answer != $char ]]; then
        print "♻️ Try again!"
      fi
    done

    score=$((score+1))
    print "😊 Nice practice!"
  done

  echo "You did it! Great practicing 💪"
  echo "Enjoy your $(reward_score)"

}

# Utils

print() {
  echo $1
  sleep $((1 + ${#1} / 10))
  clear
}

reward_score() {
  str=""
  count=0
  while [[ $count -lt $score ]]; do
    str="$str$reward"
    count=$((count+1))
  done;
  echo $str
}

# Init

main
