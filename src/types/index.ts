export interface StoreTemplate {
  id: string;
  name: string;
  category: string;
  description: string;
  menuItems: MenuItem[];
  stockItems: StockItem[];
  employees?: Employee[];
  taxSummary?: TaxSummary;
}

export interface MenuItem {
  id: string;
  name: string;
  price: number;
  category: string;
  cost: number;
  description?: string;
  isPopular?: boolean;
}

export interface Order {
  id: string;
  customerName: string;
  items: Array<{
    menuItemId: string;
    quantity: number;
    price: number;
  }>;
  subtotal: number;
  tax: number;
  total: number;
  status: 'pending' | 'paid' | 'completed' | 'cancelled';
  createdAt: string;
  paymentMethod?: string;
}

export interface StockItem {
  id: string;
  name: string;
  unit: string;
  quantity: number;
  minStock: number;
  costPerUnit: number;
  category: string;
}

export interface Employee {
  id: string;
  name: string;
  role: string;
  hourlyRate: number;
  active: boolean;
}

export interface AttendanceRecord {
  id: string;
  employeeId: string;
  date: string;
  checkIn: string;
  checkOut?: string;
  hoursWorked: number;
  status: 'present' | 'late' | 'absent' | 'off';
}

export interface TaxSummary {
  period: string;
  subtotal: number;
  taxAmount: number;
  total: number;
  taxRate: number;
}
