import React, { useState } from 'react';
import { Menu, Sun, Moon } from 'lucide-react';

interface HeaderProps {
  toggleSidebar: () => void;
  toggleTheme: () => void;
  isDarkMode: boolean;
}

export function Header({ toggleSidebar, toggleTheme, isDarkMode }: HeaderProps) {
  return (
    <header className="bg-white dark:bg-gray-800 border-b border-gray-200 dark:border-gray-700">
      <div className="h-16 px-4 flex items-center justify-between">
        <button
          onClick={toggleSidebar}
          className="p-2 rounded-md hover:bg-gray-100 dark:hover:bg-gray-700"
        >
          <Menu className="h-6 w-6 text-gray-500 dark:text-gray-400" />
        </button>
        
        <div className="flex items-center space-x-4">
          <button
            onClick={toggleTheme}
            className="p-2 rounded-md hover:bg-gray-100 dark:hover:bg-gray-700"
          >
            {isDarkMode ? (
              <Sun className="h-6 w-6 text-gray-500 dark:text-gray-400" />
            ) : (
              <Moon className="h-6 w-6 text-gray-500 dark:text-gray-400" />
            )}
          </button>
        </div>
      </div>
    </header>
  );
}