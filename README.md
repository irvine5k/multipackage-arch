# multipackage-arch

A example of multipackage arch

# How to run:

## Flutter Run Command

```
cd app
flutter run
```

## Run from App Folder on IDE

Run > Run Debugging or Run > Run Without Debugging

## Configure your IDE to identify the main.dart from app package as a program.

Example:

```json
{
    "version": "0.2.0",
    "configurations": [
 
        {
            "name": "app",
            "request": "launch",
            "type": "dart",
            "program": "packages/app/lib/main.dart",
            
        },
       
    ]
}
```

# How to a command in our packages:

```
melos exec {flutter_command}
```
