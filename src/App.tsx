import React from 'react';
import { BrowserRouter, Routes, Route } from 'react-router-dom';
import { QueryClient, QueryClientProvider } from '@tanstack/react-query';
import { NotificationProvider } from './contexts/NotificationContext';
import { FilterPersistenceProvider } from './contexts/FilterPersistenceContext';
import { Layout } from './components/layout/Layout';

// Import pages directly
import Dashboard from './pages/Dashboard';
import Companies from './pages/Companies';
import Locations from './pages/Locations';
import Circuits from './pages/Circuits';
import Proposals from './pages/Proposals';

// Create Query Client
const queryClient = new QueryClient({
  defaultOptions: {
    queries: {
      retry: 1,
      refetchOnWindowFocus: false,
    },
  },
});

function App() {
  return (
    <QueryClientProvider client={queryClient}>
      <NotificationProvider>
        <FilterPersistenceProvider>
          <BrowserRouter>
            <Routes>
              <Route path="/" element={<Layout />}>
                <Route index element={<Dashboard />} />
                <Route path="companies" element={<Companies />} />
                <Route path="locations" element={<Locations />} />
                <Route path="circuits" element={<Circuits />} />
                <Route path="proposals" element={<Proposals />} />
              </Route>
            </Routes>
          </BrowserRouter>
        </FilterPersistenceProvider>
      </NotificationProvider>
    </QueryClientProvider>
  );
}

export default App;