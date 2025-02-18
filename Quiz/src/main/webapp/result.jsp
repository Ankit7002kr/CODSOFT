<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="Ankit.Question" %>

<%
    List<Question> questions = (List<Question>) session.getAttribute("questions");
    Integer score = (Integer) session.getAttribute("score");
    List<Integer> userAnswers = (List<Integer>) session.getAttribute("userAnswers");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Quiz Result</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #667eea, #764ba2);
            font-family: 'Poppins', sans-serif;
            color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            flex-direction: column;
            text-align: center;
        }

        .result-container {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            padding: 30px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
            width: 80%;
            max-width: 700px;
            text-align: center;
        }

        .score-circle {
            width: 120px;
            height: 120px;
            background: linear-gradient(135deg, #ff758c, #ff7eb3);
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 24px;
            font-weight: bold;
            color: white;
            margin: 20px auto;
            box-shadow: 0 5px 15px rgba(255, 255, 255, 0.2);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 10px;
            overflow: hidden;
        }

        th, td {
            padding: 12px;
            border: 1px solid rgba(255, 255, 255, 0.3);
            text-align: center;
            font-size: 14px;
        }

        th {
            background: rgba(255, 255, 255, 0.3);
            color: #fff;
        }

        .correct {
            color: #4CAF50;
            font-weight: bold;
        }

        .incorrect {
            color: #FF5733;
            font-weight: bold;
        }

        .restart-btn {
            display: inline-block;
            margin-top: 20px;
            padding: 12px 25px;
            background: linear-gradient(135deg, #11C7B6, #0fa69c);
            color: white;
            font-size: 18px;
            font-weight: bold;
            border-radius: 30px;
            text-decoration: none;
            transition: transform 0.3s, background 0.3s;
        }

        .restart-btn:hover {
            transform: scale(1.1);
            background: linear-gradient(135deg, #0fa69c, #11C7B6);
        }

    </style>
</head>
<body>
    <div class="result-container">
        <h1>🎉 Congratulations! 🎉</h1>
        <div class="score-circle">
            <%= score %> / <%= questions.size() %>
        </div>

        <h3>📋 Quiz Summary:</h3>
        <table>
            <tr>
                <th>#</th>
                <th>Question</th>
                <th>Your Answer</th>
                <th>Correct Answer</th>
                <th>Result</th>
            </tr>
            <%
                for (int i = 0; i < questions.size(); i++) {
                    Question question = questions.get(i);
                    int userAnswerIndex = userAnswers.get(i);
                    int correctAnswerIndex = question.getCorrectOptionIndex();
                    String userAnswer = userAnswerIndex >= 0 ? question.getOptions().get(userAnswerIndex) : "No Answer";
                    String correctAnswer = question.getOptions().get(correctAnswerIndex);
                    boolean isCorrect = userAnswerIndex == correctAnswerIndex;
            %>
            <tr>
                <td><%= i + 1 %></td>
                <td><%= question.getQuestionText() %></td>
                <td><%= userAnswer %></td>
                <td><%= correctAnswer %></td>
                <td class="<%= isCorrect ? "correct" : "incorrect" %>">
                    <%= isCorrect ? "✔ Correct" : "✘ Incorrect" %>
                </td>
            </tr>
            <% } %>
        </table>
        
       
    </div>
</body>
</html>
