import React, { useEffect, useMemo, useState } from 'react';
import { loadTemplates } from '../utils/templateLoader';
import type { StockItem } from '../types';

type InventoryProps = {
  stockItems?: StockItem[];
  onStockChange?: (updatedStock: StockItem[]) => void;
};

const Inventory: React.FC<InventoryProps> = ({ stockItems: externalStockItems, onStockChange }) => {
  const templates = useMemo(() => loadTemplates(), []);
  const [selectedTemplateId, setSelectedTemplateId] = useState<string>(templates[0]?.id ?? '');
  const [stockItems, setStockItems] = useState<StockItem[]>(() => {
    return externalStockItems ?? templates[0]?.stockItems ?? [];
  });

  useEffect(() => {
    if (externalStockItems && externalStockItems.length > 0) {
      setStockItems(externalStockItems);
    }
  }, [externalStockItems]);

  const handleTemplateChange = (templateId: string) => {
    const selectedTemplate = templates.find((template) => template.id === templateId);
    setSelectedTemplateId(templateId);
    if (selectedTemplate?.stockItems) {
      setStockItems(selectedTemplate.stockItems);
    }
  };

  const adjustStock = (itemId: string, delta: number) => {
    const updated = stockItems.map((item) => {
      if (item.id !== itemId) return item;
      return { ...item, quantity: Math.max(0, item.quantity + delta) };
    });
    setStockItems(updated);
    onStockChange?.(updated);
  };

  const consumeStock = (itemId: string, quantity: number) => {
    const updated = stockItems.map((item) => {
      if (item.id !== itemId) return item;
      return { ...item, quantity: Math.max(0, item.quantity - quantity) };
    });
    setStockItems(updated);
    onStockChange?.(updated);
  };

  const getStatus = (item: StockItem) => {
    if (item.quantity <= item.minStock) return '⚠️ ของใกล้หมด';
    return '✅ พร้อมใช้';
  };

  return (
    <div style={{ padding: 16, background: '#f8fafc', minHeight: '100vh', fontFamily: 'Segoe UI, sans-serif' }}>
      <div style={{ maxWidth: 1100, margin: '0 auto', background: '#fff', borderRadius: 24, padding: 20, boxShadow: '0 10px 24px rgba(15,23,42,0.08)' }}>
        <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: 16 }}>
          <div>
            <div style={{ fontSize: 12, color: '#64748b', fontWeight: 700, textTransform: 'uppercase', letterSpacing: 1.1 }}>Inventory</div>
            <h2 style={{ margin: '4px 0 0', fontSize: 24, color: '#0f172a' }}>จัดการสต็อกและวัตถุดิบ</h2>
          </div>
          <select
            value={selectedTemplateId}
            onChange={(event) => handleTemplateChange(event.target.value)}
            style={{ padding: '10px 12px', borderRadius: 12, border: '1px solid #cbd5e1' }}
          >
            {templates.map((template) => (
              <option key={template.id} value={template.id}>
                {template.name}
              </option>
            ))}
          </select>
        </div>

        <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(240px, 1fr))', gap: 12 }}>
          {stockItems.map((item) => {
            const isLow = item.quantity <= item.minStock;
            return (
              <div key={item.id} style={{ border: '1px solid #e2e8f0', borderRadius: 16, padding: 14, background: isLow ? '#fff7ed' : '#f8fafc' }}>
                <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
                  <div style={{ fontWeight: 800, color: '#0f172a' }}>{item.name}</div>
                  <span
                    style={{
                      background: isLow ? '#f59e0b' : '#10b981',
                      color: '#fff',
                      padding: '4px 8px',
                      borderRadius: 999,
                      fontSize: 12,
                      fontWeight: 700,
                    }}
                  >
                    {isLow ? '⚠️ ของใกล้หมด' : 'พร้อม'}
                  </span>
                </div>

                <div style={{ marginTop: 10, color: '#64748b', fontSize: 13 }}>
                  <div>หมวด: {item.category}</div>
                  <div>หน่วย: {item.unit}</div>
                  <div>ขั้นต่ำ: {item.minStock}</div>
                </div>

                <div style={{ marginTop: 12, fontSize: 30, fontWeight: 800, color: isLow ? '#b45309' : '#0f172a' }}>
                  {item.quantity}
                </div>

                <div style={{ marginTop: 10, display: 'flex', gap: 8 }}>
                  <button onClick={() => adjustStock(item.id, -1)} style={{ flex: 1, padding: '8px 0', borderRadius: 10, border: '1px solid #cbd5e1', background: '#fff', cursor: 'pointer', fontWeight: 700 }}>-</button>
                  <button onClick={() => adjustStock(item.id, 1)} style={{ flex: 1, padding: '8px 0', borderRadius: 10, border: '1px solid #cbd5e1', background: '#fff', cursor: 'pointer', fontWeight: 700 }}>+</button>
                </div>

                <div style={{ marginTop: 10, display: 'flex', gap: 8 }}>
                  <button onClick={() => consumeStock(item.id, 1)} style={{ flex: 1, padding: '8px 0', borderRadius: 10, border: '1px solid #cbd5e1', background: '#fef2f2', color: '#b91c1c', cursor: 'pointer', fontWeight: 700 }}>ตัด 1 ชิ้น</button>
                  <button onClick={() => consumeStock(item.id, 3)} style={{ flex: 1, padding: '8px 0', borderRadius: 10, border: '1px solid #cbd5e1', background: '#fefce8', color: '#a16207', cursor: 'pointer', fontWeight: 700 }}>ตัด 3 ชิ้น</button>
                </div>
              </div>
            );
          })}
        </div>

        <div style={{ marginTop: 18, borderTop: '1px solid #e2e8f0', paddingTop: 14 }}>
          <div style={{ fontWeight: 800, marginBottom: 8 }}>เชื่อมกับออเดอร์จาก POS</div>
          <button
            onClick={() => {
              const updated = stockItems.map((item) =>
                item.id === 'chicken' ? { ...item, quantity: Math.max(0, item.quantity - 2) } : item
              );
              setStockItems(updated);
              onStockChange?.(updated);
            }}
            style={{ border: 'none', borderRadius: 12, padding: '10px 14px', background: '#2563eb', color: '#fff', fontWeight: 700, cursor: 'pointer' }}
          >
            จำลองการตัดสต็อกจากออเดอร์สำเร็จ
          </button>
        </div>
      </div>
    </div>
  );
};

export default Inventory;
