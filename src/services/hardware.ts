export type ReceiptPayload = {
  items: Array<{ name: string; quantity: number }>;
  total: number;
  paymentMethod: 'cash' | 'promptpay';
};

export function triggerCashDrawer() {
  console.log('🔓 Cash drawer opened');
}

export function printReceipt(payload: ReceiptPayload) {
  const lines = [
    '=== Receipt ===',
    `Payment: ${payload.paymentMethod === 'cash' ? 'Cash' : 'PromptPay'}`,
    ...payload.items.map((item) => `- ${item.name} x${item.quantity}`),
    `Total: ${payload.total.toLocaleString()} บาท`,
    'Thank you',
  ];

  console.log(lines.join('\n'));
}
