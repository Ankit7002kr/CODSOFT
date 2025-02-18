<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Grade Result</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #f0f2f5; }
        .result-container {
            max-width: 400px;
            margin: 50px auto;
            padding: 20px;
            background: white;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .grade-text { font-size: 24px; font-weight: bold; }
        .btn-custom { background: #007bff; color: white; font-weight: bold; }
    </style>
</head>
<body>
    <div class="container">
        <div class="result-container">
            <h3 class="text-success">Student Result</h3>
            <%  
                float math = Float.parseFloat(request.getParameter("math"));
                float eng = Float.parseFloat(request.getParameter("eng"));
                float hnd = Float.parseFloat(request.getParameter("hnd"));
                float sci = Float.parseFloat(request.getParameter("sci"));
                float cs = Float.parseFloat(request.getParameter("cs"));
                
                float total = math + eng + hnd + sci + cs;
                float avg = total / 5;
                String grade = "";
                
                if (avg >= 90) grade = "A+";
                else if (avg >= 80) grade = "A";
                else if (avg >= 75) grade = "B+";
                else if (avg >= 70) grade = "B";
                else if (avg >= 60) grade = "C+";
                else if (avg >= 50) grade = "C";
                else if (avg >= 40) grade = "D";
                else grade = "Fail";
            %>
            <p class="grade-text text-primary">Total Marks: <%= total %></p>
            <p class="grade-text text-info">Average Percentage: <%= avg %>%</p>
            <p class="grade-text text-danger">Grade: <%= grade %></p>
            <a href="index.jsp" class="btn btn-custom w-100 mt-3">Calculate Again</a>
        </div>
    </div>
</body>
</html>
