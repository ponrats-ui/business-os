import React, { useEffect, useMemo, useState } from 'react';
import { loadTemplates } from '../utils/templateLoader';
import type { MenuItem, StoreTemplate } from '../types';
import { printReceipt, triggerCashDrawer } from '../services/hardware';

type CartItem = {
  id: string;
  name: string;
  price: number;
  quantity: number;
  note: string;
};

type PaymentMethod = 'cash' | 'promptpay';

type POSProps = {
  onCheckout?: (amount: number, items: Array<{ name: string; quantity: number }>, paymentMethod: PaymentMethod) => void;
};

const currencyFormatter = new Intl.NumberFormat('th-TH', {
  style: 'currency',
  currency: 'THB',
  maximumFractionDigits: 0,
});

const POS: React.FC<POSProps> = ({ onCheckout }) => {
  const templates = useMemo(() => loadTemplates(), []);
  const [selectedTemplateId, setSelectedTemplateId] = useState<string>(templates[0]?.id ?? '');
  const [activeCategory, setActiveCategory] = useState<string>('All');
  const [paymentMethod, setPaymentMethod] = useState<PaymentMethod>('cash');
  const [selectedItem, setSelectedItem] = useState<MenuItem | null>(null);
  const [selectedExtras, setSelectedExtras] = useState<string[]>([]);
  const [cart, setCart] = useState<CartItem[]>([]);
  const [cashReceived, setCashReceived] = useState<string>('');
  const [isCashModalOpen, setIsCashModalOpen] = useState(false);

  const selectedTemplate = useMemo<StoreTemplate | undefined>(
    () => templates.find((template) => template.id === selectedTemplateId),
    [selectedTemplateId, templates]
  );

  const menuItems = selectedTemplate?.menuItems ?? [];

  const categories = useMemo(() => {
    const uniqueCategories = Array.from(new Set(menuItems.map((item) => item.category)));
    return ['All', ...uniqueCategories];
  }, [menuItems]);

  const filteredItems = useMemo(() => {
    if (activeCategory === 'All') {
      return menuItems;
    }
    return menuItems.filter((item) => item.category === activeCategory);
  }, [activeCategory, menuItems]);

  useEffect(() => {
    setActiveCategory('All');
    setSelectedItem(menuItems[0] ?? null);
    setSelectedExtras([]);
  }, [selectedTemplateId, menuItems]);

  const totalAmount = useMemo(() => {
    return cart.reduce((sum, item) => sum + item.price * item.quantity, 0);
  }, [cart]);

  const cashReceivedValue = Number(cashReceived || 0);
  const changeAmount = Math.max(cashReceivedValue - totalAmount, 0);

  const toggleExtra = (extra: string) => {
    setSelectedExtras((prev) =>
      prev.includes(extra) ? prev.filter((item) => item !== extra) : [...prev, extra]
    );
  };

  const addToCart = (item: MenuItem) => {
    const extraCharge = selectedExtras.reduce((sum, extra) => {
      if (extra === 'พิเศษ') return sum + 20;
      if (extra === 'ไข่ดาว') return sum + 15;
      return sum;
    }, 0);

    const finalPrice = item.price + extraCharge;
    const note = selectedExtras.length > 0 ? selectedExtras.join(', ') : 'ธรรมดา';

    setCart((prev) => {
      const existing = prev.find((entry) => entry.id === item.id && entry.note === note);
      if (existing) {
        return prev.map((entry) =>
          entry.id === item.id && entry.note === note
            ? { ...entry, quantity: entry.quantity + 1, price: finalPrice }
            : entry
        );
      }

      return [...prev, { id: item.id, name: item.name, price: finalPrice, quantity: 1, note }];
    });
  };

  const updateQuantity = (id: string, note: string, delta: number) => {
    setCart((prev) =>
      prev
        .map((entry) => {
          if (entry.id === id && entry.note === note) {
            return { ...entry, quantity: Math.max(entry.quantity + delta, 0) };
          }
          return entry;
        })
        .filter((entry) => entry.quantity > 0)
    );
  };

  const removeItem = (id: string, note: string) => {
    setCart((prev) => prev.filter((entry) => !(entry.id === id && entry.note === note)));
  };

  const quickCashPreset = (amount: number) => {
    setCashReceived(String(amount));
  };

  const handleCheckout = (method: PaymentMethod) => {
    if (cart.length === 0) return;

    const checkoutItems = cart.map((item) => ({ name: item.name, quantity: item.quantity }));
    onCheckout?.(totalAmount, checkoutItems, method);
    triggerCashDrawer();
    printReceipt({ items: checkoutItems, total: totalAmount, paymentMethod: method });
    setCart([]);
    setCashReceived('');
    setIsCashModalOpen(false);
  };

  return (
    <div style={{ minHeight: '100vh', background: '#f5f7fb', padding: 16, fontFamily: 'Segoe UI, sans-serif' }}>
      <div style={{ maxWidth: 1400, margin: '0 auto', display: 'grid', gridTemplateColumns: '1.35fr 0.9fr', gap: 16 }}>
        <section style={{ background: '#fff', borderRadius: 24, padding: 18, boxShadow: '0 12px 32px rgba(15,23,42,0.08)' }}>
          <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: 14 }}>
            <div>
              <div style={{ fontSize: 12, fontWeight: 700, color: '#64748b', textTransform: 'uppercase', letterSpacing: 1.2 }}>
                Point of Sale
              </div>
              <h2 style={{ margin: '4px 0 0', fontSize: 22, color: '#0f172a' }}>หน้าคิดเงินสตรีทฟู้ด</h2>
            </div>
            <select
              value={selectedTemplateId}
              onChange={(event) => setSelectedTemplateId(event.target.value)}
              style={{ padding: '10px 12px', borderRadius: 10, border: '1px solid #cbd5e1', fontSize: 14 }}
            >
              {templates.map((template) => (
                <option key={template.id} value={template.id}>
                  {template.name}
                </option>
              ))}
            </select>
          </div>

          <div style={{ display: 'flex', gap: 8, flexWrap: 'wrap', marginBottom: 14 }}>
            {categories.map((category) => (
              <button
                key={category}
                onClick={() => setActiveCategory(category)}
                style={{
                  border: 'none',
                  borderRadius: 999,
                  padding: '8px 12px',
                  background: activeCategory === category ? '#2563eb' : '#e2e8f0',
                  color: activeCategory === category ? '#fff' : '#334155',
                  fontWeight: 700,
                  cursor: 'pointer',
                }}
              >
                {category}
              </button>
            ))}
          </div>

          <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(170px, 1fr))', gap: 12 }}>
            {filteredItems.map((item) => (
              <button
                key={item.id}
                onClick={() => {
                  setSelectedItem(item);
                  setSelectedExtras([]);
                }}
                style={{
                  border: selectedItem?.id === item.id ? '2px solid #2563eb' : '1px solid #dbe4ee',
                  borderRadius: 18,
                  padding: 14,
                  background: '#f8fbff',
                  textAlign: 'left',
                  cursor: 'pointer',
                }}
              >
                <div style={{ fontSize: 34, marginBottom: 8 }}>🍽️</div>
                <div style={{ fontWeight: 800, color: '#0f172a', fontSize: 15 }}>{item.name}</div>
                <div style={{ fontSize: 12, color: '#64748b', marginTop: 4 }}>{item.category}</div>
                <div style={{ fontSize: 16, fontWeight: 800, color: '#ef4444', marginTop: 8 }}>
                  {currencyFormatter.format(item.price)}
                </div>
              </button>
            ))}
          </div>

          <div style={{ marginTop: 16, background: '#f8fafc', borderRadius: 16, padding: 14 }}>
            <div style={{ fontWeight: 800, color: '#0f172a', marginBottom: 8 }}>ตัวเลือกเสริม</div>
            <div style={{ display: 'flex', gap: 10, flexWrap: 'wrap' }}>
              {['พิเศษ', 'ไข่ดาว'].map((extra) => {
                const selected = selectedExtras.includes(extra);
                return (
                  <label
                    key={extra}
                    style={{
                      display: 'flex',
                      alignItems: 'center',
                      gap: 6,
                      background: selected ? '#dbeafe' : '#fff',
                      padding: '8px 10px',
                      borderRadius: 999,
                      border: '1px solid #cbd5e1',
                      cursor: 'pointer',
                    }}
                  >
                    <input type="checkbox" checked={selected} onChange={() => toggleExtra(extra)} />
                    <span>{extra}</span>
                  </label>
                );
              })}
            </div>

            <div style={{ marginTop: 12 }}>
              <button
                onClick={() => selectedItem && addToCart(selectedItem)}
                style={{
                  width: '100%',
                  border: 'none',
                  borderRadius: 14,
                  padding: '12px 14px',
                  background: 'linear-gradient(135deg, #2563eb, #3b82f6)',
                  color: '#fff',
                  fontWeight: 800,
                  cursor: 'pointer',
                }}
              >
                เพิ่มลงตะกร้า • {selectedItem ? currencyFormatter.format(selectedItem.price) : '0'}
              </button>
            </div>
          </div>
        </section>

        <aside style={{ background: '#fff', borderRadius: 24, padding: 18, boxShadow: '0 12px 32px rgba(15,23,42,0.08)', display: 'flex', flexDirection: 'column', gap: 12 }}>
          <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
            <div>
              <div style={{ fontSize: 12, fontWeight: 700, color: '#64748b', textTransform: 'uppercase', letterSpacing: 1.2 }}>Cart</div>
              <h3 style={{ margin: '4px 0 0', fontSize: 20, color: '#0f172a' }}>รายการสั่งซื้อ</h3>
            </div>
            <div style={{ background: '#eff6ff', color: '#2563eb', padding: '8px 10px', borderRadius: 999, fontWeight: 800 }}>
              {cart.length} รายการ
            </div>
          </div>

          <div style={{ minHeight: 240, border: '1px solid #e2e8f0', borderRadius: 16, padding: 10, background: '#fcfdff' }}>
            {cart.length === 0 ? (
              <div style={{ color: '#64748b', textAlign: 'center', paddingTop: 70 }}>ยังไม่มีรายการในตะกร้า</div>
            ) : (
              cart.map((item) => (
                <div key={`${item.id}-${item.note}`} style={{ borderBottom: '1px solid #e2e8f0', padding: '10px 0' }}>
                  <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
                    <div>
                      <div style={{ fontWeight: 800 }}>{item.name}</div>
                      <div style={{ fontSize: 12, color: '#64748b' }}>{item.note}</div>
                    </div>
                    <div style={{ fontWeight: 800, color: '#ef4444' }}>{currencyFormatter.format(item.price * item.quantity)}</div>
                  </div>
                  <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginTop: 8 }}>
                    <div style={{ display: 'flex', alignItems: 'center', gap: 8 }}>
                      <button onClick={() => updateQuantity(item.id, item.note, -1)} style={{ width: 28, height: 28, borderRadius: 8, border: '1px solid #cbd5e1', background: '#fff', cursor: 'pointer' }}>-</button>
                      <span style={{ fontWeight: 700 }}>{item.quantity}</span>
                      <button onClick={() => updateQuantity(item.id, item.note, 1)} style={{ width: 28, height: 28, borderRadius: 8, border: '1px solid #cbd5e1', background: '#fff', cursor: 'pointer' }}>+</button>
                    </div>
                    <button onClick={() => removeItem(item.id, item.note)} style={{ border: 'none', background: 'transparent', color: '#dc2626', fontWeight: 700, cursor: 'pointer' }}>ลบ</button>
                  </div>
                </div>
              ))
            )}
          </div>

          <div style={{ background: '#0f172a', color: '#fff', borderRadius: 18, padding: 14 }}>
            <div style={{ display: 'flex', justifyContent: 'space-between', marginBottom: 8 }}>
              <span>ยอดรวม</span>
              <strong>{currencyFormatter.format(totalAmount)}</strong>
            </div>
            <div style={{ display: 'flex', justifyContent: 'space-between', fontSize: 18, fontWeight: 800 }}>
              <span>ยอดสุทธิ</span>
              <span>{currencyFormatter.format(totalAmount)}</span>
            </div>
          </div>

          <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 10 }}>
            <button
              onClick={() => setPaymentMethod('cash')}
              style={{
                border: paymentMethod === 'cash' ? '2px solid #2563eb' : '1px solid #dbe4ee',
                borderRadius: 14,
                padding: '12px 10px',
                background: paymentMethod === 'cash' ? '#dbeafe' : '#fff',
                fontWeight: 800,
                cursor: 'pointer',
              }}
            >
              💵 เงินสด
            </button>
            <button
              onClick={() => setPaymentMethod('promptpay')}
              style={{
                border: paymentMethod === 'promptpay' ? '2px solid #2563eb' : '1px solid #dbe4ee',
                borderRadius: 14,
                padding: '12px 10px',
                background: paymentMethod === 'promptpay' ? '#dbeafe' : '#fff',
                fontWeight: 800,
                cursor: 'pointer',
              }}
            >
              📱 QR PromptPay
            </button>
          </div>

          {paymentMethod === 'cash' ? (
            <button
              onClick={() => setIsCashModalOpen(true)}
              style={{ border: 'none', borderRadius: 14, padding: '12px 14px', background: '#10b981', color: '#fff', fontWeight: 800, cursor: 'pointer' }}
            >
              ชำระด้วยเงินสด
            </button>
          ) : (
            <div style={{ border: '1px solid #dbe4ee', borderRadius: 16, padding: 12, background: '#f8fafc' }}>
              <div style={{ fontWeight: 800, marginBottom: 8 }}>PromptPay QR</div>
              <div style={{ display: 'flex', justifyContent: 'center' }}>
                <div style={{ width: 180, height: 180, background: '#fff', border: '1px solid #cbd5e1', padding: 8, borderRadius: 12 }}>
                  <div style={{ display: 'grid', gridTemplateColumns: 'repeat(7, 1fr)', gap: 4 }}>
                    {Array.from({ length: 49 }).map((_, index) => {
                      const active = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48].includes(index);
                      return <div key={index} style={{ width: 16, height: 16, background: active ? '#0f172a' : '#f8fafc', borderRadius: 2 }} />;
                    })}
                  </div>
                </div>
              </div>
              <div style={{ marginTop: 8, textAlign: 'center', color: '#64748b', fontSize: 13 }}>
                สแกนเพื่อชำระ {currencyFormatter.format(totalAmount)}
              </div>
              <button
                onClick={() => handleCheckout('promptpay')}
                style={{ marginTop: 10, width: '100%', border: 'none', borderRadius: 12, padding: '10px 12px', background: '#2563eb', color: '#fff', fontWeight: 800, cursor: 'pointer' }}
              >
                ยืนยันการชำระ PromptPay
              </button>
            </div>
          )}
        </aside>
      </div>

      {isCashModalOpen && (
        <div style={{ position: 'fixed', inset: 0, background: 'rgba(15,23,42,0.45)', display: 'flex', alignItems: 'center', justifyContent: 'center', padding: 16 }}>
          <div style={{ width: '100%', maxWidth: 420, background: '#fff', borderRadius: 24, padding: 20, boxShadow: '0 16px 40px rgba(15,23,42,0.24)' }}>
            <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: 12 }}>
              <h3 style={{ margin: 0, fontSize: 20 }}>รับเงินสด</h3>
              <button onClick={() => setIsCashModalOpen(false)} style={{ border: 'none', background: 'transparent', fontSize: 18, cursor: 'pointer' }}>✕</button>
            </div>

            <div style={{ display: 'flex', gap: 8, marginBottom: 10 }}>
              {[100, 500, 1000].map((preset) => (
                <button
                  key={preset}
                  onClick={() => quickCashPreset(preset)}
                  style={{ border: '1px solid #cbd5e1', background: '#f8fafc', borderRadius: 10, padding: '8px 10px', cursor: 'pointer' }}
                >
                  {preset}
                </button>
              ))}
            </div>

            <label style={{ display: 'block', fontWeight: 700, marginBottom: 6 }}>จำนวนเงินที่รับ</label>
            <input
              type="number"
              value={cashReceived}
              onChange={(event) => setCashReceived(event.target.value)}
              placeholder="กรอกจำนวนเงิน"
              style={{ width: '100%', padding: '12px 10px', borderRadius: 12, border: '1px solid #cbd5e1', fontSize: 16, marginBottom: 12 }}
            />

            <div style={{ background: '#eff6ff', borderRadius: 14, padding: 12 }}>
              <div style={{ display: 'flex', justifyContent: 'space-between', marginBottom: 6 }}>
                <span>ยอดชำระ</span>
                <strong>{currencyFormatter.format(totalAmount)}</strong>
              </div>
              <div style={{ display: 'flex', justifyContent: 'space-between', marginBottom: 6 }}>
                <span>เงินที่รับ</span>
                <strong>{currencyFormatter.format(cashReceivedValue)}</strong>
              </div>
              <div style={{ display: 'flex', justifyContent: 'space-between', fontSize: 20, fontWeight: 800, color: changeAmount > 0 ? '#0f766e' : '#dc2626' }}>
                <span>เงินทอน</span>
                <span>{currencyFormatter.format(changeAmount)}</span>
              </div>
            </div>

            <button
              onClick={() => handleCheckout('cash')}
              style={{ width: '100%', marginTop: 12, border: 'none', borderRadius: 14, padding: '12px 14px', background: '#0f172a', color: '#fff', fontWeight: 800, cursor: 'pointer' }}
            >
              ยืนยันการรับเงิน
            </button>
          </div>
        </div>
      )}
    </div>
  );
};

export default POS;
