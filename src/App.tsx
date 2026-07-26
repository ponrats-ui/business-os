import React, { useMemo, useState } from 'react';
import POS from './components/POS';
import Inventory from './components/Inventory';
import Payroll from './components/Payroll';
import Tax from './components/Tax';
import { loadTemplates } from './utils/templateLoader';
import type { Employee, StockItem } from './types';

type TabKey = 'pos' | 'inventory' | 'payroll' | 'tax';

const App: React.FC = () => {
  const templates = useMemo(() => loadTemplates(), []);
  const [activeTab, setActiveTab] = useState<TabKey>('pos');
  const [stockItems, setStockItems] = useState<StockItem[]>(() => templates[0]?.stockItems ?? []);
  const [totalSales, setTotalSales] = useState(0);
  const employees: Employee[] = useMemo(
    () => [
      { id: 'emp-001', name: 'สมชาย', role: 'พ่อครัว', hourlyRate: 120, active: true },
      { id: 'emp-002', name: 'ปรียา', role: 'แคชเชียร์', hourlyRate: 95, active: true },
    ],
    []
  );

  const handleCheckout = (amount: number) => {
    setTotalSales((prev) => prev + amount);
  };

  const handleStockChange = (updatedStock: StockItem[]) => {
    setStockItems(updatedStock);
  };

  const tabs: Array<{ key: TabKey; label: string; icon: string }> = [
    { key: 'pos', label: 'คิดเงิน POS', icon: '🛒' },
    { key: 'inventory', label: 'สต็อกวัตถุดิบ', icon: '📦' },
    { key: 'payroll', label: 'จัดการพนักงาน', icon: '👥' },
    { key: 'tax', label: 'สรุปภาษี', icon: '🏛️' },
  ];

  return (
    <div style={{ minHeight: '100vh', background: '#f5f7fb' }}>
      <div style={{ position: 'sticky', top: 0, zIndex: 10, background: '#fff', borderBottom: '1px solid #e2e8f0', padding: '12px 16px' }}>
        <div style={{ display: 'flex', gap: 8, flexWrap: 'wrap', justifyContent: 'center' }}>
          {tabs.map((tab) => (
            <button
              key={tab.key}
              onClick={() => setActiveTab(tab.key)}
              style={{
                border: activeTab === tab.key ? '2px solid #2563eb' : '1px solid #cbd5e1',
                background: activeTab === tab.key ? '#dbeafe' : '#fff',
                color: activeTab === tab.key ? '#1d4ed8' : '#334155',
                borderRadius: 999,
                padding: '10px 14px',
                fontWeight: 800,
                cursor: 'pointer',
              }}
            >
              {tab.icon} {tab.label}
            </button>
          ))}
        </div>
      </div>

      {activeTab === 'pos' && <POS onCheckout={handleCheckout} />}
      {activeTab === 'inventory' && <Inventory stockItems={stockItems} onStockChange={handleStockChange} />}
      {activeTab === 'payroll' && <Payroll employees={employees} />}
      {activeTab === 'tax' && <Tax totalSales={totalSales} stockItems={stockItems} />}
    </div>
  );
};

export default App;
