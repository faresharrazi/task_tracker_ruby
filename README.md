# Task Tracker CLI

A simple CLI tool to manage tasks with features like adding, updating, deleting, and listing tasks. Tasks are stored in a `tasks.json` file.
[Project URL](https://roadmap.sh/projects/task-tracker)

## Features

- Add, update, and delete tasks
- Mark tasks as `todo`, `in-progress`, or `done`
- List all tasks or filter by status

## Setup

1. Ensure Ruby is installed by running the following command: `ruby -v`  
2. Clone this repository and navigate to the project folder:  
   `git clone <repository-url>`  
3. Run the script using:  
   `ruby task-cli.rb <command> [arguments]`

## Commands

### Add a Task  
Add a new task to the tracker:  
`ruby task_tracker.rb add "Task description"`  
Example:  
`ruby task_tracker.rb add "Buy groceries"`

### Update a Task  
Update the description of an existing task:  
`ruby task_tracker.rb update <task_id> "New description"`  
Example:  
`ruby task_tracker.rb update 1 "Buy groceries and cook dinner"`

### Delete a Task  
Delete a task from the tracker:  
`ruby task_tracker.rb delete <task_id>`  
Example:  
`ruby task_tracker.rb delete 1`

### Mark Task as In-Progress or Done  
Mark as In-Progress:  
`ruby task_tracker.rb mark-in-progress <task_id>`  
Example:  
`ruby task_tracker.rb mark-in-progress 1`  

Mark as Done:  
`ruby task_tracker.rb mark-done <task_id>`  
Example:  
`ruby task_tracker.rb mark-done 1`

### List Tasks  
List all tasks:  
`ruby task_tracker.rb list`  

Filter tasks by status:  
`ruby task_tracker.rb list <status>`  
Where `<status>` can be `todo`, `in-progress`, or `done`.  
Example:  
`ruby task_tracker.rb list done`

## File Structure

The project directory is structured as follows:

├ task_tracker.rb       
├ tasks.json        
├ README.md 


## Task Properties

Each task in the `tasks.json` file contains the following fields:  
- **id**: Unique identifier for the task  
- **description**: Task description  
- **status**: Current status (`todo`, `in-progress`, or `done`)  
- **createdAt**: Timestamp when the task was created  
- **updatedAt**: Timestamp when the task was last updated  

Example task entry in `tasks.json`:  
```json
{
  "id": 1,
  "description": "Cook Dinner",
  "status": "todo",
  "createdAt": "2024-11-16 12:46:29 +0200",
  "updatedAt": "2024-11-16 12:46:29 +0200"
}
