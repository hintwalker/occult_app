## Cấu trúc dữ liệu
```
root
-- users (collection) -> chuyển thành u
---- [email_id] (document)
------ b (banned): String
------ d (displayName): String
------ e (email): String
------ l (lastSeen): number
------ p (photoUrl): String
------ s (status): String

-- e (Energy) (collection)
---- [email_id] (document)
------ e (collection)
-------- i (document)
---------- v (value): number

-- sp (Storage Plans)
---- [id] (document)
------ c (charts): number
------ cm (commentaries): number
------ e (energy): number
------ n (notes): number
------ t (tags): number
------ tt (title): String

-- a (admin) (collection)
---- [email_id] (document)
------ e (email): String

-- tuvi (collection)
---- [email_id] (document)

------ charts (collection) ----> change to c
-------- [created date] (document)
---------- _s (Storage state): String (o: overload | null: allowed)
---------- a (avatar): String
---------- b (birthday): number
---------- g (gender): number
---------- l (last viewed): number
---------- n (name): String
---------- w (watching year): number
---------- z (timezone): number

------ cs (Current Subscription) (collection)
-------- 0 (document)
---------- b (begin): number
---------- e (energy per 30 days): number
---------- p (plan): String
---------- s (status): String
---------- t (total): number
---------- x (expired): number
---------- z (timezone): number

------ ct (Chart Tag) (collection)
-------- [created date] (document)
---------- c (chart id): number
---------- t (tag id): number

------ s (Subscription) (collection)
-------- [created date] (document)
---------- b (begin): number
---------- e (energy per 30 days): number
---------- p (plan): String
---------- s (status): String
---------- t (total): number
---------- x (expired): number
---------- z (timezone): number

------ tags (Tag) (collection) ----> change to t
-------- [created date] (document)
---------- _s (Storage state): String
---------- d (Description): String
---------- t (Title): String

------ notes (Note) (collection) ----> change to n
-------- [created date] (document)
---------- _s (Storage state): String
---------- c (Content): String
---------- ci (Chart id): number
---------- e (Edited): number
---------- t (Title): String

------ cm (Commentary) (collection)
-------- [created date] (document)
---------- _s (Storage state): String
---------- c (Content): String
---------- ci (Chart id): number
---------- l (Last viewed): number
---------- t (Title): String
---------- _v (Price): number
---------- _p (Paid): number (0: unpaid | 1: paid)
```
