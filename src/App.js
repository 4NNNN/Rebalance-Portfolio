import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import { AppProvider } from './context/AppConfig';
import Homepage from './pages/Homepage';
import Landing from './pages/Landing';

function App() {
  return (
    <Router>
      <AppProvider>
        <Routes>
          <Route path='/' element={<Landing />}></Route>
          <Route path='/homepage' element={<Homepage />}></Route>
        </Routes>
      </AppProvider>
    </Router>

  );
}

export default App;
