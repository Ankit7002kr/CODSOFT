<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Start Quiz</title>
    <style type="text/css">
    *{
    margin:0;
    padding:0;
    }
    body{
    background-image:url("back.jpeg");
    background-size: cover; 
    background-position: center;
    background-repeat: no-repeat; 
    background-attachment: fixed;
    display: flex;
    flex-direction:column;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
    }
    h1{
     color:white;
     margin-top:80px;
     font-size:3rem;
    }
    button {
    margin-top:20px;
            font-weight: bold;
            font-size: 20px;
            padding: 15px 30px;
            background-color: #11C7B6;
            color: white;
            border: none;
            border-radius: 20px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        button:hover {
            background-color: #0fa394;
        }
    }
    </style>
</head>
<body>
    <h1>Welcome to the Quiz</h1>
    <form action="QuizServlet" method="post">
        <button type="submit">Start Quiz</button>
    </form>
</body>
</html>
