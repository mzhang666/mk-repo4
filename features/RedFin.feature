Feature: Test property search functionality for RedFin site
   
   
   

   Scenario: SignIn and search
   Given I open Redfin
   When I log in using username "mikedmzhang@gmail.com" and password "IPE3V7ChUr"       
   When I search using address "2667 Dietrich Dr, Tustin CA 92782"
   Then Property should show up "2667 Dietrich Dr, Tustin CA 92782"