import React from 'react';
import HomePage from './components/Home/HomePage';
import { BrowserRouter, Routes, Route } from "react-router-dom";
import PokemonDetails from './components/PokemonDetails/PokemonDetails';
// import './App.css'

const App: React.FC = () => {
  return (
    <div id="App">
      <BrowserRouter>
      <Routes>
        <Route path="/" element={<HomePage />} />
        <Route path="/pokemon/:id" element={<PokemonDetails />} />
      </Routes>
    </BrowserRouter>
    </div>
  );
};

export default App;
