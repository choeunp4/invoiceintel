-- ═══════════════════════════════════════════════════════════════
-- INVOICEINTEL — Database Update
-- Run this in Supabase SQL Editor
-- ═══════════════════════════════════════════════════════════════

-- 1. Add file_url column to invoices if not exists
alter table invoices add column if not exists file_url text;
alter table invoices add column if not exists file_name text;
alter table invoices add column if not exists file_type text;

-- 2. Update items table to support two-level categories
alter table items add column if not exists parent_category text;
alter table items add column if not exists sub_category text;

-- 3. Update item_aliases to store confidence score
alter table item_aliases add column if not exists notes text;

-- ═══════════════════════════════════════════════════════════════
-- 4. SEED CANONICAL ITEMS — Two-level category system
-- ═══════════════════════════════════════════════════════════════

insert into items (name, category, parent_category, sub_category) values

-- ── SEAFOOD ──────────────────────────────────────────────────
('Salmon',                'Seafood', 'Seafood', 'Salmon'),
('Ora King Salmon',       'Seafood', 'Seafood', 'Salmon'),
('Faroe Island Salmon',   'Seafood', 'Seafood', 'Salmon'),
('Atlantic Salmon',       'Seafood', 'Seafood', 'Salmon'),
('Scottish Salmon',       'Seafood', 'Seafood', 'Salmon'),
('King Salmon',           'Seafood', 'Seafood', 'Salmon'),
('Coho Salmon',           'Seafood', 'Seafood', 'Salmon'),
('Sockeye Salmon',        'Seafood', 'Seafood', 'Salmon'),

('Kanpachi',              'Seafood', 'Seafood', 'Kanpachi / Amberjack'),
('Ikejime Kanpachi',      'Seafood', 'Seafood', 'Kanpachi / Amberjack'),
('Amberjack',             'Seafood', 'Seafood', 'Kanpachi / Amberjack'),
('Greater Amberjack',     'Seafood', 'Seafood', 'Kanpachi / Amberjack'),

('Yellowtail',            'Seafood', 'Seafood', 'Yellowtail / Hamachi'),
('Hamachi',               'Seafood', 'Seafood', 'Yellowtail / Hamachi'),
('Hiramasa',              'Seafood', 'Seafood', 'Yellowtail / Hamachi'),

('Tuna',                  'Seafood', 'Seafood', 'Tuna'),
('Bluefin Tuna',          'Seafood', 'Seafood', 'Tuna'),
('Yellowfin Tuna',        'Seafood', 'Seafood', 'Tuna'),
('Bigeye Tuna',           'Seafood', 'Seafood', 'Tuna'),
('Albacore Tuna',         'Seafood', 'Seafood', 'Tuna'),

('Halibut',               'Seafood', 'Seafood', 'Halibut'),
('Pacific Halibut',       'Seafood', 'Seafood', 'Halibut'),
('Atlantic Halibut',      'Seafood', 'Seafood', 'Halibut'),

('Sea Bass',              'Seafood', 'Seafood', 'Sea Bass'),
('Chilean Sea Bass',      'Seafood', 'Seafood', 'Sea Bass'),
('Branzino',              'Seafood', 'Seafood', 'Sea Bass'),
('Black Sea Bass',        'Seafood', 'Seafood', 'Sea Bass'),

('Shrimp',                'Seafood', 'Seafood', 'Shrimp'),
('Shrimp 16/20',          'Seafood', 'Seafood', 'Shrimp'),
('Shrimp 21/25',          'Seafood', 'Seafood', 'Shrimp'),
('Gulf Shrimp',           'Seafood', 'Seafood', 'Shrimp'),

('Scallops',              'Seafood', 'Seafood', 'Scallops'),
('Diver Scallops',        'Seafood', 'Seafood', 'Scallops'),
('Day Boat Scallops',     'Seafood', 'Seafood', 'Scallops'),

('Lobster',               'Seafood', 'Seafood', 'Lobster'),
('Maine Lobster',         'Seafood', 'Seafood', 'Lobster'),
('Lobster Tail',          'Seafood', 'Seafood', 'Lobster'),

('Crab',                  'Seafood', 'Seafood', 'Crab'),
('King Crab',             'Seafood', 'Seafood', 'Crab'),
('Snow Crab',             'Seafood', 'Seafood', 'Crab'),
('Dungeness Crab',        'Seafood', 'Seafood', 'Crab'),

('Oysters',               'Seafood', 'Seafood', 'Oysters / Shellfish'),
('Clams',                 'Seafood', 'Seafood', 'Oysters / Shellfish'),
('Mussels',               'Seafood', 'Seafood', 'Oysters / Shellfish'),

('Snapper',               'Seafood', 'Seafood', 'Snapper / Grouper'),
('Red Snapper',           'Seafood', 'Seafood', 'Snapper / Grouper'),
('Grouper',               'Seafood', 'Seafood', 'Snapper / Grouper'),

('Cod',                   'Seafood', 'Seafood', 'Cod / Haddock'),
('Haddock',               'Seafood', 'Seafood', 'Cod / Haddock'),
('Black Cod',             'Seafood', 'Seafood', 'Cod / Haddock'),

('Swordfish',             'Seafood', 'Seafood', 'Swordfish / Mahi'),
('Mahi Mahi',             'Seafood', 'Seafood', 'Swordfish / Mahi'),

-- ── MEAT & POULTRY ──────────────────────────────────────────
('Beef Tenderloin',       'Meat & Poultry', 'Meat & Poultry', 'Beef'),
('Filet Mignon',          'Meat & Poultry', 'Meat & Poultry', 'Beef'),
('Ribeye',                'Meat & Poultry', 'Meat & Poultry', 'Beef'),
('NY Strip',              'Meat & Poultry', 'Meat & Poultry', 'Beef'),
('Ground Beef',           'Meat & Poultry', 'Meat & Poultry', 'Beef'),
('Short Rib',             'Meat & Poultry', 'Meat & Poultry', 'Beef'),
('Wagyu Beef',            'Meat & Poultry', 'Meat & Poultry', 'Beef'),

('Chicken Breast',        'Meat & Poultry', 'Meat & Poultry', 'Chicken'),
('Chicken Wing',          'Meat & Poultry', 'Meat & Poultry', 'Chicken'),
('Chicken Thigh',         'Meat & Poultry', 'Meat & Poultry', 'Chicken'),
('Whole Chicken',         'Meat & Poultry', 'Meat & Poultry', 'Chicken'),

('Duck Breast',           'Meat & Poultry', 'Meat & Poultry', 'Duck'),
('Duck Leg',              'Meat & Poultry', 'Meat & Poultry', 'Duck'),
('Whole Duck',            'Meat & Poultry', 'Meat & Poultry', 'Duck'),

('Pork Belly',            'Meat & Poultry', 'Meat & Poultry', 'Pork'),
('Pork Chop',             'Meat & Poultry', 'Meat & Poultry', 'Pork'),
('Pork Tenderloin',       'Meat & Poultry', 'Meat & Poultry', 'Pork'),
('Baby Back Ribs',        'Meat & Poultry', 'Meat & Poultry', 'Pork'),

('Lamb Chop',             'Meat & Poultry', 'Meat & Poultry', 'Lamb'),
('Lamb Rack',             'Meat & Poultry', 'Meat & Poultry', 'Lamb'),
('Lamb Shank',            'Meat & Poultry', 'Meat & Poultry', 'Lamb'),

('Veal Chop',             'Meat & Poultry', 'Meat & Poultry', 'Veal'),
('Veal Osso Buco',        'Meat & Poultry', 'Meat & Poultry', 'Veal'),

-- ── PRODUCE ─────────────────────────────────────────────────
('Roma Tomatoes',         'Produce', 'Produce', 'Tomatoes'),
('Heirloom Tomatoes',     'Produce', 'Produce', 'Tomatoes'),
('Cherry Tomatoes',       'Produce', 'Produce', 'Tomatoes'),

('Russet Potatoes',       'Produce', 'Produce', 'Potatoes'),
('Yukon Gold Potatoes',   'Produce', 'Produce', 'Potatoes'),
('Fingerling Potatoes',   'Produce', 'Produce', 'Potatoes'),

('White Onion',           'Produce', 'Produce', 'Onions'),
('Red Onion',             'Produce', 'Produce', 'Onions'),
('Shallots',              'Produce', 'Produce', 'Onions'),

('Garlic',                'Produce', 'Produce', 'Alliums'),
('Leeks',                 'Produce', 'Produce', 'Alliums'),

('Mixed Greens',          'Produce', 'Produce', 'Greens'),
('Spinach',               'Produce', 'Produce', 'Greens'),
('Arugula',               'Produce', 'Produce', 'Greens'),
('Kale',                  'Produce', 'Produce', 'Greens'),

('Button Mushrooms',      'Produce', 'Produce', 'Mushrooms'),
('Cremini Mushrooms',     'Produce', 'Produce', 'Mushrooms'),
('Shiitake Mushrooms',    'Produce', 'Produce', 'Mushrooms'),
('Truffle',               'Produce', 'Produce', 'Mushrooms'),

('Lemon',                 'Produce', 'Produce', 'Citrus'),
('Lime',                  'Produce', 'Produce', 'Citrus'),
('Orange',                'Produce', 'Produce', 'Citrus'),

('Asparagus',             'Produce', 'Produce', 'Vegetables'),
('Broccolini',            'Produce', 'Produce', 'Vegetables'),
('Zucchini',              'Produce', 'Produce', 'Vegetables'),
('Eggplant',              'Produce', 'Produce', 'Vegetables'),
('Bell Pepper',           'Produce', 'Produce', 'Vegetables'),
('Corn',                  'Produce', 'Produce', 'Vegetables'),

-- ── DAIRY ───────────────────────────────────────────────────
('Butter',                'Dairy', 'Dairy', 'Butter'),
('Cultured Butter',       'Dairy', 'Dairy', 'Butter'),
('Clarified Butter',      'Dairy', 'Dairy', 'Butter'),

('Heavy Cream',           'Dairy', 'Dairy', 'Cream'),
('Half & Half',           'Dairy', 'Dairy', 'Cream'),
('Crème Fraîche',         'Dairy', 'Dairy', 'Cream'),

('Mozzarella',            'Dairy', 'Dairy', 'Cheese'),
('Burrata',               'Dairy', 'Dairy', 'Cheese'),
('Parmesan',              'Dairy', 'Dairy', 'Cheese'),
('Ricotta',               'Dairy', 'Dairy', 'Cheese'),
('Goat Cheese',           'Dairy', 'Dairy', 'Cheese'),
('Gorgonzola',            'Dairy', 'Dairy', 'Cheese'),

('Farm Eggs',             'Dairy', 'Dairy', 'Eggs'),
('Duck Eggs',             'Dairy', 'Dairy', 'Eggs'),

('Whole Milk',            'Dairy', 'Dairy', 'Milk'),
('Oat Milk',              'Dairy', 'Dairy', 'Milk'),

-- ── DRY GOODS ───────────────────────────────────────────────
('All-Purpose Flour',     'Dry Goods', 'Dry Goods', 'Flour'),
('Bread Flour',           'Dry Goods', 'Dry Goods', 'Flour'),
('Semolina',              'Dry Goods', 'Dry Goods', 'Flour'),

('Olive Oil',             'Dry Goods', 'Dry Goods', 'Oils'),
('Truffle Oil',           'Dry Goods', 'Dry Goods', 'Oils'),
('Vegetable Oil',         'Dry Goods', 'Dry Goods', 'Oils'),

('Pasta',                 'Dry Goods', 'Dry Goods', 'Pasta / Grains'),
('Rice',                  'Dry Goods', 'Dry Goods', 'Pasta / Grains'),
('Arborio Rice',          'Dry Goods', 'Dry Goods', 'Pasta / Grains'),
('Polenta',               'Dry Goods', 'Dry Goods', 'Pasta / Grains'),

('Panko Breadcrumbs',     'Dry Goods', 'Dry Goods', 'Breadcrumbs'),
('Breadcrumbs',           'Dry Goods', 'Dry Goods', 'Breadcrumbs'),

('Sea Salt',              'Dry Goods', 'Dry Goods', 'Seasonings'),
('Black Pepper',          'Dry Goods', 'Dry Goods', 'Seasonings'),
('Sugar',                 'Dry Goods', 'Dry Goods', 'Sweeteners'),
('Honey',                 'Dry Goods', 'Dry Goods', 'Sweeteners'),

-- ── BEVERAGES ───────────────────────────────────────────────
('Sparkling Water',       'Beverages', 'Beverages', 'Water'),
('Still Water',           'Beverages', 'Beverages', 'Water'),
('Club Soda',             'Beverages', 'Beverages', 'Mixers'),
('Tonic Water',           'Beverages', 'Beverages', 'Mixers'),
('Juices',                'Beverages', 'Beverages', 'Juice')

on conflict (name) do nothing;

-- ═══════════════════════════════════════════════════════════════
-- 5. STORAGE POLICY UPDATE
-- ═══════════════════════════════════════════════════════════════
insert into storage.buckets (id, name, public)
values ('invoice-files', 'invoice-files', false)
on conflict (id) do nothing;

create policy "allow all invoice files" on storage.objects
for all using (bucket_id = 'invoice-files')
on conflict do nothing;
