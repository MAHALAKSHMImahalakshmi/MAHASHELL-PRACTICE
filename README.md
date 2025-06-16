# 🌟 My Shell Scripting Learning Journey 💻✨

Welcome to my Shell Scripting Learning Journey! 🎉
This repository documents my exciting exploration of shell scripting, from the basics to advanced automation projects.
Each script in this journey represents a step forward, filled with learnings and aha moments! 🌈


## 🐞 Firstly, Let's Look at the Mistakes I Encountered and How I Debugged Them , Before Starting the Roadmap Journey

During my shell scripting journey, I faced issues like scripts working manually but failing in crontab due to environment differences—especially with the PATH variable and command locations. 🛑 By analyzing error messages, checking environment variables, and adjusting script placement and permissions, I was able to resolve these problems. 🛠️ After overcoming these challenges, I continued to build my skills, which shaped the roadmap of my learning journey in shell scripting. 🚀

# 🛠️ Backup Script Debugging Journey 🚀

## Scenario

Recently, I developed a script to create backups of files and scheduled it in **crontab**. While the script executed successfully when run manually, it failed with a "command not found" error in **crontab**.  
You can find the script here: [`21-backup.sh`](MAHASHELL-PRACTICE/21-backup.sh)  
For log cleanup, see: [`20-delete-old-logs.sh`](MAHASHELL-PRACTICE/20-delete-old-logs.sh)

---

## Debugging Process 🐞

1. **Initial Setup**

   - The script was created and tested:
     ```bash
     sudo sh 21-backup.sh ../source-dir ../dest-dir
     ```
   - Output:
     ```
     You are running with root access
     Files to zip are: ../source-dir/cat.log ../source-dir/catalogue.log ../source-dir/shipping.log
     ```

2. **Error in Crontab** ❌

   - Crontab output:
     ```
     Jun 5 15:16:01 CROND[16399]: CMDOUT (/bin/sh: line 1: sudo: command not found)
     ```

3. **Analysis** 🔍

   - **PATH Issue:** Crontab uses a minimal environment. The `echo $PATH` command revealed that `/usr/local/bin` was missing from the crontab PATH:
     ```
     CMDOUT (/usr/bin:/bin)
     ```

4. **Solution** 🛠️

   - Moved the script to `/usr/bin` for better compatibility:
     ```bash
     sudo cp [21-backup.sh](http://_vscodecontentref_/0) /usr/bin/backup
     sudo chmod +x /usr/bin/backup
     ```
   - Updated the crontab to run the command:
     ```
     * * * * * sudo backup /home/ec2-user/source-dir /home/ec2-user/dest-dir
     ```

---

## Key Learnings 💡

- **Crontab Environment**
  - Default `PATH` for crontab is minimal: `/usr/bin:/bin`.
  - Commands/scripts must be placed in directories accessible within this path.

- **Path Debugging**
  - Use `echo $PATH` to verify the environment for:
    - **Normal User:** `/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin`
    - **Root User:** Same as above.
    - **Crontab:** Minimal paths `/usr/bin:/bin`.

- **Conversion to Command**
  - Scripts in `/usr/local/bin` may not work in crontab.
  - Moving the script to `/usr/bin` ensures compatibility:
    ```bash
    sudo cp script.sh /usr/bin/command-name
    sudo chmod +x /usr/bin/command-name
    ```

- **Using `visudo` for PATH Modification**
  - Add `/usr/local/bin` to `secure_path` in `sudo` settings:
    ```bash
    sudo visudo
    ```
    Add:
    ```
    Defaults secure_path = /usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
    ```

---

## Final Working Crontab 🕒

- Schedule the backup to run daily at 3:00 AM:

---

## Outcome 🎉

- The script successfully creates backups and cleans up old files.
- Logs are updated dynamically, and the crontab runs seamlessly without errors.

---

## Key Commands Used 🛠️

```bash
sudo cp [21-backup.sh](http://_vscodecontentref_/1) /usr/bin/backup
sudo chmod +x /usr/bin/backup
sudo visudo
echo $PATH
```
 # 🛣️ Roadmap to Learning Shell Scripting 🧭
 
 ## 🟢 Phase 1: Basics of Shell Scripting 🐣
 
Starting with the fundamentals, these scripts introduce essential concepts:

### 05-input.sh 📝

Read user input interactively.

Key Concepts: read, input validation.

## #06-timestamp.sh 🕒

Display the current date and time.

Key Concepts: date.

### 07-arithmetic-op.sh ➕➖✖️➗

Perform basic arithmetic operations.

Key Concepts: expr, let.

 ## 🟡 Phase 2: Intermediate Concepts 🌟
 
Building on the basics, this phase dives into loops, arrays, and conditions:

### 08-array.sh 🧮

Learn how to work with arrays.

Key Concepts: Array declaration, accessing elements.

### 10-compare.sh 🧐

Compare variables and make decisions.

Key Concepts: if, -eq, -ne.

### 04-arguments.sh 🎯

Pass arguments to scripts.

Key Concepts: $1, $@.

### 17-loop.sh 🔁

Master loops for repetitive tasks.

Key Concepts: while, for.

### 09-sv.sh 🔑 Understanding Special Variables

This script explores the special shell variables that provide runtime information about the script and its environment.

Key Concepts:

$@: All arguments passed to the script.

$#: Number of arguments passed.

$0: Name of the script.

$PWD: Present working directory.

$HOME: User's home directory.

$USER: Username of the script runner.

$$: PID of the script.

$!: PID of the last background command.

Sample Usage:
```

./09-sv.sh arg1 arg2 arg3  
```
## 🟠 Phase 3: Advanced Scripting Techniques 🧙‍♂️✨

Explore more powerful features of shell scripting, including functions, logging, and colors!

### 12-function.sh 🛠️

Reusable functions for modular code.

Key Concepts: Defining functions, returning values.

### 15-log-fun-col.sh 🌈📜

Add colorful logging to your scripts.

Key Concepts: tee, ANSI color codes.

### 20-delete-old-logs.sh 🗑️

Automate log cleanup.

Key Concepts: find, mtime.

### 21-backup.sh 💾

Create backups with scheduled tasks.

Key Concepts: crontab, tar archives.

## 🔴 Phase 4: Real-World Applications 🌍🚀

Time to apply the skills to real-world scenarios:

### robhoshop.sh 🤖

Automate cloud instance creation.

Key Concepts: EC2 setup, scripting for infrastructure.

### 22-disk-usage.sh 📊

Monitor and manage disk usage.

Key Concepts: df, du.

### srivenkata.sh 🎉

✨ My First Script! ✨

This script was my first-ever script, where I printed my first message:
```

echo "hi svr"
```

# Key Concepts: Basics of echo.

💡 Sometimes, a simple "Hello, World!" is all you need to kickstart your journey.

🎓 What I Learned Along the Way 📘
🛠️ How to automate repetitive tasks using shell commands.

🔍 Debugging techniques to troubleshoot errors.

🌟 Creating real-world solutions for file management and system monitoring.

✨ Combining creativity with scripting for colorful and dynamic outputs!

# 🛠️ How to Run the Scripts 🚀
Clone the repository:
```

git clone https://github.com/MAHALAKSHMImahalakshmi/autoShellRoboshop.git
cd autoShellRoboshop
```

Make the script executable (if not already):

```

chmod +x <script-name>.sh
```

Run the script:
```

sudo sh <script-name>.sh
```

💡 Using sudo ensures proper permissions, especially for scripts requiring root access.

# 🌟 My Top Picks 💖

### ✨ 15-log-fun-col.sh: Fun with colors and logs! 🌈

### ✨ robhoshop.sh: A real-world automation adventure. 🤖

### ✨ srivenkata.sh: My nostalgic first print script. 🎉

# 🤝 Join Me in Learning Shell Scripting 🧑‍🤝‍🧑
🤩 This journey is just the beginning. Explore the scripts, fork the repo, and share your own shell scripting experiments!
Let’s grow and learn together. 🚀
