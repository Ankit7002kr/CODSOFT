<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Grade Calculator</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #f8f9fa; }
        .grade-container {
            max-width: 350px;
            margin: 50px auto;
            padding: 20px;
            background: white;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
        .form-label { font-weight: 500; }
        .btn-custom { background: #007bff; color: white; font-weight: bold; }
    </style>
</head>
<body>
    <div class="container">
        <div class="grade-container text-center">
            <h3 class="text-primary mb-3">Grade Calculator</h3>
            <form action="result.jsp" method="post">
                <div class="row g-2">
                    <div class="col-6">
                        <label class="form-label">Math</label>
                        <input type="number" name="math" class="form-control" required min="0" max="100">
                    </div>
                    <div class="col-6">
                        <label class="form-label">English</label>
                        <input type="number" name="eng" class="form-control" required min="0" max="100">
                    </div>
                    <div class="col-6">
                        <label class="form-label">Hindi</label>
                        <input type="number" name="hnd" class="form-control" required min="0" max="100">
                    </div>
                    <div class="col-6">
                        <label class="form-label">Science</label>
                        <input type="number" name="sci" class="form-control" required min="0" max="100">
                    </div>
                    <div class="col-12">
                        <label class="form-label">Computer Science</label>
                        <input type="number" name="cs" class="form-control" required min="0" max="100">
                    </div>
                </div>
                <button type="submit" class="btn btn-custom w-100 mt-3">Calculate</button>
            </form>
        </div>
    </div>
</body>
</html>
