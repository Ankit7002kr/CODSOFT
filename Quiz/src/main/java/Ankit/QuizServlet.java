package Ankit;


import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;




@WebServlet("/QuizServlet")
public class QuizServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        // Retrieve session attributes
        List<Question> questions = (List<Question>) session.getAttribute("questions");
        Integer currentQuestionIndex = (Integer) session.getAttribute("currentQuestionIndex");
        Integer score = (Integer) session.getAttribute("score");
        List<Integer> userAnswers = (List<Integer>) session.getAttribute("userAnswers");

        // Initialize quiz session variables only if it's a fresh session
        if (questions == null) {
            questions = new ArrayList<>();
            questions.add(new Question("Who is known as the 'God of Cricket'?", 
            	    Arrays.asList("Virat Kohli", "Sachin Tendulkar", "MS Dhoni", "Kapil Dev"), 1));  

            	questions.add(new Question("Which country won the first-ever ICC Cricket World Cup in 1975?", 
            	    Arrays.asList("India", "Australia", "West Indies", "England"), 2));  

            	questions.add(new Question("Who holds the record for the highest individual score in ODIs?", 
            	    Arrays.asList("Rohit Sharma", "Martin Guptill", "Virender Sehwag", "Chris Gayle"), 0));  

            	questions.add(new Question("Which bowler has taken the most wickets in Test cricket?", 
            	    Arrays.asList("Muttiah Muralitharan", "Shane Warne", "James Anderson", "Anil Kumble"), 0));  

            	questions.add(new Question("Who was the captain of the Indian team when they won the 2011 ICC World Cup?", 
            	    Arrays.asList("Virat Kohli", "Rahul Dravid", "MS Dhoni", "Sourav Ganguly"), 2));  

            	questions.add(new Question("Which Indian cricketer has hit six sixes in an over in international cricket?", 
            	    Arrays.asList("Yuvraj Singh", "Rohit Sharma", "Virender Sehwag", "MS Dhoni"), 0));  

            	questions.add(new Question("Which team has won the most IPL titles as of 2024?", 
            	    Arrays.asList("Chennai Super Kings", "Mumbai Indians", "Kolkata Knight Riders", "Rajasthan Royals"), 1));  

            	questions.add(new Question("Who is the fastest bowler to reach 500 Test wickets?", 
            	    Arrays.asList("Dale Steyn", "Glenn McGrath", "Muttiah Muralitharan", "Ravichandran Ashwin"), 2));  

            	questions.add(new Question("Which Indian cricketer is known as the 'Hitman'?", 
            	    Arrays.asList("Shikhar Dhawan", "Virat Kohli", "Rohit Sharma", "Hardik Pandya"), 2));  

            	questions.add(new Question("Who was the first batsman to score a double century in ODIs?", 
            	    Arrays.asList("Sachin Tendulkar", "Virender Sehwag", "Rohit Sharma", "Chris Gayle"), 0));  


            session.setAttribute("questions", questions);
            
            // Fix: Ensure `currentQuestionIndex` starts at 0
            currentQuestionIndex = 0;
            session.setAttribute("currentQuestionIndex", currentQuestionIndex);

            score = 0;
            userAnswers = new ArrayList<>();
            session.setAttribute("userAnswers", userAnswers);
            session.setAttribute("score", score);
        }

        // Process user's answer only if it's not the first load
        if (request.getParameter("answer") != null && currentQuestionIndex < questions.size()) {
            int selectedIndex = Integer.parseInt(request.getParameter("answer"));
            userAnswers.add(selectedIndex);

            Question currentQuestion = questions.get(currentQuestionIndex);
            if (selectedIndex == currentQuestion.getCorrectOptionIndex()) {
                score++;  // Increment score if correct
            }

            // Update session attributes
            session.setAttribute("score", score);
            session.setAttribute("userAnswers", userAnswers);

            // Move to the next question
            currentQuestionIndex++;
            session.setAttribute("currentQuestionIndex", currentQuestionIndex);
        }

        // Redirect to next question or result page if quiz is over
        if (currentQuestionIndex >= questions.size()) {
            response.sendRedirect("result.jsp");
        } else {
            response.sendRedirect("question.jsp");
        }
    }
}
