import React, { useMemo } from 'react';
import type { StockItem } from '../types';

type TaxProps = {
  totalSales: number;
  stockItems?: StockItem[];
};

const Tax: React.FC<TaxProps> = ({ totalSales, stockItems = [] }) => {
  const annualVatLimit = 1800000;
  const progressPercent = Math.min((totalSales / annualVatLimit) * 100, 100);

  const estimatedTax = useMemo(() => {
    const deductibleExpense = totalSales * 0.6;
    const taxableIncome = Math.max(totalSales - deductibleExpense, 0);
    return taxableIncome * 0.15;
  }, [totalSales]);

  const isNearLimit = progressPercent >= 75;

  const exportReport = () => {
    const report = `Tax Summary\nยอดขายสะสม: ${totalSales.toLocaleString()} บาท\nVAT Progress: ${progressPercent.toFixed(1)}%\nประมาณภาษี: ${estimatedTax.toFixed(0)} บาท\nจำนวนรายการสต็อก: ${stockItems.length}`;
    alert(report);
  };

  return (
    <div style={{ padding: 16, background: '#f8fafc', minHeight: '100vh', fontFamily: 'Segoe UI, sans-serif' }}>
      <div style={{ maxWidth: 1000, margin: '0 auto', background: '#fff', borderRadius: 24, padding: 20, boxShadow: '0 10px 24px rgba(15,23,42,0.08)' }}>
        <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: 16 }}>
          <div>
            <div style={{ fontSize: 12, color: '#64748b', fontWeight: 700, textTransform: 'uppercase', letterSpacing: 1.1 }}>Tax</div>
            <h2 style={{ margin: '4px 0 0', fontSize: 24, color: '#0f172a' }}>สรุปภาษีและยอดขาย</h2>
          </div>
          <span style={{ background: isNearLimit ? '#f59e0b' : '#10b981', color: '#fff', padding: '8px 12px', borderRadius: 999, fontWeight: 800 }}>
            {isNearLimit ? '⚠️ ใกล้เกณฑ์ VAT' : '✅ ปลอดภัย'}
          </span>
        </div>

        <div style={{ background: '#f8fafc', borderRadius: 16, padding: 16, marginBottom: 16 }}>
          <div style={{ display: 'flex', justifyContent: 'space-between', marginBottom: 8 }}>
            <span style={{ fontWeight: 700 }}>ยอดขายสะสม</span>
            <strong>{totalSales.toLocaleString()} / {annualVatLimit.toLocaleString()} บาท</strong>
          </div>
          <div style={{ height: 16, borderRadius: 999, background: '#e2e8f0', overflow: 'hidden' }}>
            <div style={{ width: `${progressPercent}%`, height: '100%', background: progressPercent >= 100 ? '#ef4444' : progressPercent >= 75 ? '#f59e0b' : '#2563eb', transition: 'width 0.3s ease' }} />
          </div>
          <div style={{ marginTop: 8, fontSize: 14, color: '#64748b' }}>
            {progressPercent.toFixed(1)}% ของเพดาน VAT ต่อปี
          </div>
        </div>

        <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(240px, 1fr))', gap: 12 }}>
          <div style={{ border: '1px solid #e2e8f0', borderRadius: 16, padding: 14 }}>
            <div style={{ fontSize: 13, color: '#64748b' }}>ประมาณภาษีเงินได้บุคคลธรรมดา</div>
            <div style={{ fontSize: 24, fontWeight: 800, color: '#0f172a', marginTop: 6 }}>{estimatedTax.toFixed(0)} บาท</div>
            <div style={{ fontSize: 13, color: '#64748b', marginTop: 4 }}>คำนวณจากค่าใช้จ่ายเหมา 60%</div>
          </div>

          <div style={{ border: '1px solid #e2e8f0', borderRadius: 16, padding: 14 }}>
            <div style={{ fontSize: 13, color: '#64748b' }}>จำนวนรายการสต็อก</div>
            <div style={{ fontSize: 24, fontWeight: 800, color: '#0f172a', marginTop: 6 }}>{stockItems.length}</div>
            <div style={{ fontSize: 13, color: '#64748b', marginTop: 4 }}>ติดตามสินค้าคงคลังในระบบ</div>
          </div>
        </div>

        <button
          onClick={exportReport}
          style={{ marginTop: 16, border: 'none', borderRadius: 12, padding: '12px 14px', background: '#0f172a', color: '#fff', fontWeight: 800, cursor: 'pointer' }}
        >
          ดาวน์โหลดรายงานสรุปยื่นภาษี
        </button>
      </div>
    </div>
  );
};

export default Tax;
