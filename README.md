# FetchInterview

### Summary: Include screen shots or a video of your app highlighting its features
- In this application, I made a simple single page application that has a refreshable list. 
- The API is on a loop that counts and iterates through the 3 options provided to be able to show case the multiple UIs
- The detail screen shows an image, a deep link out to youtube, and a very simple embedded webview that shows the source recipe
- Due to time constraints, I did not have time to finish out the testing, as I would have needed to add a protocol to networking and do some refactoring to the setup in order to scalably test the ViewModel and the Network layer

### Focus Areas: What specific areas of the project did you prioritize? Why did you choose to focus on these areas?
- I prioritized 2 things, architecture and design. I was ensuring I was using a lightweight MVVM pattern that leverages SwiftUIs latest trends to build an app that would function efficiently
- I also prioritized effciency of reusability, I wanted to make sure everything was built so we can reuse elements and nothing is hardcoded in a one and done type of style

### Time Spent: Approximately how long did you spend working on this project? How did you allocate your time?
I spent roughly 3-4 hours in total getting this project together. I actually spent way longer than expected but having been hands off keyboard for over 2 years, I had some refreshing to do which is why I wasn't able to get around a good testing environment. I have lots of thoughts on how I would like to approach that though. 

### Trade-offs and Decisions: Did you make any significant trade-offs in your approach?
- I was thinking about how to have a very strong caching mechanism, and was in the middle of using local storage or swift data to perform this, however upon reading docs and understanding the scope of the project relative to time, using the existing libraries solved my problems
- Another trade off I had to make was on "Good UX". I could have spent a lot of time trying to perfect the UI but I felt that functionality was important for this first MVP
- The one thing I struggle with was around the webview. The current webview is not performant but I chose to embed to showcase my ability to work with integrating different complex technologies. Ideally, I would have preferred an in app deep link but I felt this would highlight some different technologies and solutions possible

### Weakest Part of the Project: What do you think is the weakest part of your project?
- as stated before, testing is definitely the weakest part because I did not get around to writting them.
- I would have tested the view model and netork level given all the UI has very thorough previews which confirms our ui elements. I needed to add a protocol for the FetchRecipesAPI and change what variables get passed through. If I did this, it would add the ability for the me to build a mock api for testing which in turn would let me test the view model.

### Additional Information: Is there anything else we should know? Feel free to share any insights or constraints you encountered.
- Not to pull on heart strings, but it was very important to me be able to work on and deliver this project. My father in law just passed on the day I created the project so I was a little distracted. However I wanted to be able to deliver this on a resonable time and the combination of in gaps while support my family slowed me and I apologize for the delays and incompletion of the testing. 
