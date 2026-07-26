import React, { useMemo, useState } from 'react';
import type { AttendanceRecord, Employee } from '../types';

type PayrollProps = {
  employees?: Employee[];
};

const Payroll: React.FC<PayrollProps> = ({ employees = [] }) => {
  const [records, setRecords] = useState<AttendanceRecord[]>([
    { id: 'r1', employeeId: 'emp-001', date: '2026-07-26', checkIn: '08:00', checkOut: '17:00', hoursWorked: 8, status: 'present' },
    { id: 'r2', employeeId: 'emp-002', date: '2026-07-26', checkIn: '09:20', checkOut: '17:00', hoursWorked: 7.5, status: 'late' },
  ]);

  const [selectedEmployeeId, setSelectedEmployeeId] = useState<string>(employees[0]?.id ?? 'emp-001');
  const [clockIn, setClockIn] = useState<string>('08:00');
  const [clockOut, setClockOut] = useState<string>('17:00');
  const [otHours, setOtHours] = useState<number>(0);
  const [latePenalty, setLatePenalty] = useState<number>(0);
  const [advanceDeduction, setAdvanceDeduction] = useState<number>(0);

  const employee = useMemo(() => employees.find((item) => item.id === selectedEmployeeId), [employees, selectedEmployeeId]);

  const summary = useMemo(() => {
    const presentCount = records.filter((record) => record.status === 'present').length;
    const lateCount = records.filter((record) => record.status === 'late').length;
    const absentCount = records.filter((record) => record.status === 'absent').length;
    const offCount = records.filter((record) => record.status === 'off').length;

    const basePay = employee ? employee.hourlyRate * 8 : 0;
    const otPay = employee ? employee.hourlyRate * 1.5 * otHours : 0;
    const netPay = basePay + otPay - latePenalty - advanceDeduction;

    return { presentCount, lateCount, absentCount, offCount, netPay };
  }, [records, employee, otHours, latePenalty, advanceDeduction]);

  const addAttendance = () => {
    if (!employee) return;
    const newRecord: AttendanceRecord = {
      id: `r${Date.now()}`,
      employeeId: employee.id,
      date: '2026-07-26',
      checkIn: clockIn,
      checkOut: clockOut,
      hoursWorked: 8,
      status: clockIn > '08:30' ? 'late' : 'present',
    };
    setRecords((prev) => [newRecord, ...prev]);
  };

  const generateSlip = () => {
    const slipText = `Digital Pay Slip\nพนักงาน: ${employee?.name ?? 'N/A'}\nค่าจ้างหลัก: ${employee ? Math.round(employee.hourlyRate * 8) : 0}\nค่า OT: ${Math.round(otHours * employee?.hourlyRate * 1.5 || 0)}\nหักสาย/เบิกล่วงหน้า: ${latePenalty + advanceDeduction}\nเงินสุทธิ: ${Math.round(summary.netPay)}`;
    alert(slipText);
  };

  return (
    <div style={{ padding: 16, background: '#f8fafc', minHeight: '100vh', fontFamily: 'Segoe UI, sans-serif' }}>
      <div style={{ maxWidth: 1120, margin: '0 auto', background: '#fff', borderRadius: 24, padding: 20, boxShadow: '0 10px 24px rgba(15,23,42,0.08)' }}>
        <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: 16 }}>
          <div>
            <div style={{ fontSize: 12, color: '#64748b', fontWeight: 700, textTransform: 'uppercase', letterSpacing: 1.1 }}>Payroll</div>
            <h2 style={{ margin: '4px 0 0', fontSize: 24, color: '#0f172a' }}>บันทึกเวลาและคำนวณค่าจ้าง</h2>
          </div>
          <select
            value={selectedEmployeeId}
            onChange={(event) => setSelectedEmployeeId(event.target.value)}
            style={{ padding: '10px 12px', borderRadius: 12, border: '1px solid #cbd5e1' }}
          >
            {employees.map((item) => (
              <option key={item.id} value={item.id}>
                {item.name} ({item.role})
              </option>
            ))}
          </select>
        </div>

        <div style={{ display: 'grid', gridTemplateColumns: '1.1fr 0.9fr', gap: 16 }}>
          <div style={{ border: '1px solid #e2e8f0', borderRadius: 18, padding: 14, background: '#f8fafc' }}>
            <div style={{ fontWeight: 800, marginBottom: 10 }}>Clock In / Clock Out</div>
            <div style={{ display: 'grid', gap: 10 }}>
              <label>
                <div style={{ fontSize: 13, color: '#64748b', marginBottom: 4 }}>เวลาเข้า</div>
                <input type="time" value={clockIn} onChange={(event) => setClockIn(event.target.value)} style={{ width: '100%', padding: '10px', borderRadius: 10, border: '1px solid #cbd5e1' }} />
              </label>
              <label>
                <div style={{ fontSize: 13, color: '#64748b', marginBottom: 4 }}>เวลาออก</div>
                <input type="time" value={clockOut} onChange={(event) => setClockOut(event.target.value)} style={{ width: '100%', padding: '10px', borderRadius: 10, border: '1px solid #cbd5e1' }} />
              </label>
              <label>
                <div style={{ fontSize: 13, color: '#64748b', marginBottom: 4 }}>ชั่วโมง OT</div>
                <input type="number" value={otHours} onChange={(event) => setOtHours(Number(event.target.value))} style={{ width: '100%', padding: '10px', borderRadius: 10, border: '1px solid #cbd5e1' }} />
              </label>
              <label>
                <div style={{ fontSize: 13, color: '#64748b', marginBottom: 4 }}>เงินหักสาย/เบิกล่วงหน้า</div>
                <input type="number" value={latePenalty} onChange={(event) => setLatePenalty(Number(event.target.value))} style={{ width: '100%', padding: '10px', borderRadius: 10, border: '1px solid #cbd5e1' }} />
              </label>
              <label>
                <div style={{ fontSize: 13, color: '#64748b', marginBottom: 4 }}>เงินหักล่วงหน้า</div>
                <input type="number" value={advanceDeduction} onChange={(event) => setAdvanceDeduction(Number(event.target.value))} style={{ width: '100%', padding: '10px', borderRadius: 10, border: '1px solid #cbd5e1' }} />
              </label>
              <button onClick={addAttendance} style={{ border: 'none', borderRadius: 12, padding: '10px 14px', background: '#2563eb', color: '#fff', fontWeight: 800, cursor: 'pointer' }}>บันทึกข้อมูล</button>
            </div>
          </div>

          <div style={{ border: '1px solid #e2e8f0', borderRadius: 18, padding: 14, background: '#f8fafc' }}>
            <div style={{ fontWeight: 800, marginBottom: 10 }}>สรุปสถานะประจำวัน</div>
            <div style={{ display: 'grid', gap: 8 }}>
              {[
                { label: 'มาทำงาน', value: summary.presentCount, color: '#10b981' },
                { label: 'สาย', value: summary.lateCount, color: '#f59e0b' },
                { label: 'ลา', value: summary.absentCount, color: '#64748b' },
                { label: 'ขาด', value: summary.offCount, color: '#ef4444' },
              ].map((item) => (
                <div key={item.label} style={{ display: 'flex', justifyContent: 'space-between', background: '#fff', padding: '8px 10px', borderRadius: 10 }}>
                  <span>{item.label}</span>
                  <strong style={{ color: item.color }}>{item.value}</strong>
                </div>
              ))}
            </div>

            <div style={{ marginTop: 12, background: '#0f172a', color: '#fff', borderRadius: 14, padding: 12 }}>
              <div style={{ display: 'flex', justifyContent: 'space-between' }}>
                <span>เงินสุทธิ</span>
                <strong>{summary.netPay.toFixed(0)} บาท</strong>
              </div>
            </div>

            <button onClick={generateSlip} style={{ marginTop: 12, width: '100%', border: 'none', borderRadius: 12, padding: '10px 14px', background: '#10b981', color: '#fff', fontWeight: 800, cursor: 'pointer' }}>สร้าง Digital Pay Slip</button>
          </div>
        </div>

        <div style={{ marginTop: 16, borderTop: '1px solid #e2e8f0', paddingTop: 14 }}>
          <div style={{ fontWeight: 800, marginBottom: 8 }}>รายการบันทึกเวลา</div>
          <div style={{ display: 'grid', gap: 8 }}>
            {records.map((record) => (
              <div key={record.id} style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', background: '#f8fafc', borderRadius: 12, padding: '10px 12px' }}>
                <div>
                  <div style={{ fontWeight: 800 }}>{employee?.name ?? 'พนักงาน'}</div>
                  <div style={{ fontSize: 13, color: '#64748b' }}>{record.date} • เข้า {record.checkIn} • ออก {record.checkOut ?? '-'}</div>
                </div>
                <span style={{ background: record.status === 'late' ? '#fef3c7' : '#dcfce7', color: record.status === 'late' ? '#92400e' : '#166534', padding: '6px 8px', borderRadius: 999, fontWeight: 700 }}>
                  {record.status}
                </span>
              </div>
            ))}
          </div>
        </div>
      </div>
    </div>
  );
};

export default Payroll;
