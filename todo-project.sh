#!/bin/bash


TODO_FILE="todo.txt"


load_tasks() {
  if [ -f "$TODO_FILE" ]; then
    cat "$TODO_FILE"
  else
    touch "$TODO_FILE"
  fi
}


save_tasks() {
  cat /dev/null > "$TODO_FILE"
  for task in "${tasks[@]}"; do
    echo "$task" >> "$TODO_FILE"
  done
}


create_task() {
  read -p "Enter task title: " title
  if [ -z "$title" ]; then
    echo "Title is required." >&2
    return
  fi

  read -p "Enter due date and time (YYYY-MM-DD HH:MM): " due_date
  if ! date -d "$due_date" "+%Y-%m-%d %H:%M" &>/dev/null; then
    echo "Invalid date format. Use YYYY-MM-DD HH:MM." >&2
    return
  fi

  read -p "Enter description (optional): " description
  read -p "Enter location (optional): " location

  id=$(($(tail -n 1 "$TODO_FILE" | cut -d "|" -f 1) + 1))
  task="$id|$title|$description|$location|$due_date|false"
  echo "$task" >> "$TODO_FILE"
  echo "Task '$title' created with ID $id."
}


update_task() {
  read -p "Enter task ID to update: " id
  tasks=($(load_tasks))
  for i in "${!tasks[@]}"; do
    if [ "${tasks[i]%%|*}" == "$id" ]; then
      read -p "Enter new task title: " title
      read -p "Enter new due date and time (YYYY-MM-DD HH:MM): " due_date
      read -p "Enter new description (optional): " description
      read -p "Enter new location (optional): " location
      read -p "Is the task completed? (true/false): " completed
      tasks[i]="$id|$title|$description|$location|$due_date|$completed"
      save_tasks
      echo "Task with ID $id updated."
      return
    fi
  done
  echo "Task not found." >&2
}


delete_task() {
  read -p "Enter task ID to delete: " id
  tasks=($(load_tasks))
  for i in "${!tasks[@]}"; do
    if [ "${tasks[i]%%|*}" == "$id" ]; then
      unset 'tasks[i]'
      save_tasks
      echo "Task with ID $id deleted."
      return
    fi
  done
  echo "Task not found." >&2
}


show_task() {
  read -p "Enter task ID to show: " id
  tasks=($(load_tasks))
  for task in "${tasks[@]}"; do
    if [ "${task%%|*}" == "$id" ]; then
      IFS='|' read -r id title description location due_date completed <<<"$task"
      echo "ID: $id"
      echo "Title: $title"
      echo "Description: $description"
      echo "Location: $location"
      echo "Due Date: $due_date"
      echo "Completed: $completed"
      return
    fi
  done
  echo "Task not found." >&2
}


list_tasks() {
  read -p "Enter the date (YYYY-MM-DD) to list tasks: " date
  tasks=($(load_tasks))
  echo "Completed Tasks:"
  for task in "${tasks[@]}"; do
    IFS='|' read -r id title description location due_date completed <<<"$task"
    if [[ "$due_date" == "$date"* && "$completed" == "true" ]]; then
      echo "$task"
    fi
  done
  echo
  echo "Uncompleted Tasks:"
  for task in "${tasks[@]}"; do
    IFS='|' read -r id title description location due_date completed <<<"$task"
    if [[ "$due_date" == "$date"* && "$completed" == "false" ]]; then
      echo "$task"
    fi
  done
}


search_task() {
  read -p "Enter the title to search for: " search_title
  tasks=($(load_tasks))
  for task in "${tasks[@]}"; do
    IFS='|' read -r id title description location due_date completed <<<"$task"
    if [[ "$title" == *"$search_title"* ]]; then
      echo "$task"
    fi
  done
}


display_today_tasks() {
  date=$(date '+%Y-%m-%d')
  list_tasks "$date"
}


if [ $# -eq 0 ]; then
  display_today_tasks
else
  case $1 in
    create)
      create_task
      ;;
    update)
      update_task
      ;;
    delete)
      delete_task
      ;;
    show)
      show_task
      ;;
    list)
      list_tasks
      ;;
    search)
      search_task
      ;;
    *)
      echo "Usage: $0 {create|update|delete|show|list|search}" >&2
      exit 1
      ;;
  esac
fi
