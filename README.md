# twig_bot

A new Flutter project.

## Architecture

1. State Management: Used Provider pattern for managing application state, particularly for transaction data fetching and management.

2. Screen Structure:
   - MainNavScreen : Handles bottom navigation and screen routing
   - HomePage: Displays financial summary cards
   - BotScreen: AI chatbot interface with Dialogflow integration
   - TransactionsScreen: Lists transactions with API integration
   - LoginPage: Authentication interface
  
3. Reusable Component:
   - SummaryCard: Reusable widget for displaying financial information
   - TransactionCard: Reusable widget for transaction items
   - CustomBottomNavBar: Custom bottom navigation bar

4. API integration:
   - Transactions are fetched from JSONPlaceholder API (https://jsonplaceholder.typicode.com/posts)
   - Data mapping: title → Transaction name, body → Description, id * 10 → Amount
   - Proper error handling and loading states implemented
  
## Challenges Faced

1. Dialogflow Integration:
   - Initially struggled with setting up Dialogflow credentials and authentication
   - Had to learn about service account JSON files and proper configuration
   - Faced issues with API version compatibility
  
2. Git Security:
   - Accidentally committed sensitive credentials, had to learn about Git history rewriting
   - Understanding git filter-branch and cleaning up repository history was a learning curve
  
## Screenshots
<img src="https://github.com/user-attachments/assets/df567127-c6b1-43a1-92a5-78f441971b82" width="200">
<img src="https://github.com/user-attachments/assets/f73e6ce2-0be4-40ab-a19f-2d64d5a314b1" width="200">
<img src="https://github.com/user-attachments/assets/2cb218d7-9cb8-4f8d-a7a7-5deeae3f5e10" width="200">
<img src="https://github.com/user-attachments/assets/fa198f5d-0364-48a9-a1c6-38d81b813fe4" width="200">



