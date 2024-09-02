'use client';
import React, { createContext, useState, useContext, useEffect, ReactNode } from 'react';

// Define a type for your context state, if using TypeScript
interface SearchContextType {
  search: string | null;
  updateSearch: (value: string) => void;
}

// Provide a default value for the context
const SearchContext = createContext<SearchContextType | undefined>(undefined);

export const useSearch = () => {
  const context = useContext(SearchContext);
  if (!context) {
    throw new Error('useSearch must be used within a SearchProvider');
  }
  return context;
};

// Define a type for the props, including the children prop
interface SearchProviderProps {
  children: ReactNode;
}

export const SearchProvider: React.FC<SearchProviderProps> = ({ children }) => {
  const [search, setSearch] = useState<string | null>('');

  useEffect(() => {
    const handleStorageChange = () => {
      setSearch(sessionStorage.getItem('search'));
    };

    window.addEventListener('storage', handleStorageChange);

    return () => {
      window.removeEventListener('storage', handleStorageChange);
    };
  }, []);

  const updateSearch = (value: string) => {
    sessionStorage.setItem('search', value);
    setSearch(value);
  };

  return (
    <SearchContext.Provider value={{ search, updateSearch }}>
      {children}
    </SearchContext.Provider>
  );
};
