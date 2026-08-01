-- Migration: add 'card_machine' and 'pix' values to the payment_method enum.
--
-- Front desk needs to record credit/debit card payments taken on a physical
-- (card-present) terminal, and PIX (Brazil instant payment system), as
-- already-settled tenders — the same "record payment" ledger path used today
-- for cash/bank_transfer. These are distinct from 'credit_card'/'debit_card',
-- which remain reserved for the tokenized gateway (Stripe/Adyen/etc.)
-- authorize/capture flow (KB 5.10, 6.2 — PCI tokenization only).

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_enum e
    JOIN pg_type t ON t.oid = e.enumtypid
    WHERE t.typname = 'payment_method'
      AND e.enumlabel = 'card_machine'
  ) THEN
    ALTER TYPE payment_method ADD VALUE 'card_machine';
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_enum e
    JOIN pg_type t ON t.oid = e.enumtypid
    WHERE t.typname = 'payment_method'
      AND e.enumlabel = 'pix'
  ) THEN
    ALTER TYPE payment_method ADD VALUE 'pix';
  END IF;
END $$;
