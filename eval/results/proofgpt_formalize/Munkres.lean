import .common 

open set topological_space 
open_locale classical
noncomputable theory 

universes u v

theorem exercise_13_1 {α : Type u} [topological_space α] {s : set α} (h : ∀ (a : α), a ∈ s → s ∈ nhds_within a (set.Ioi a)) : is_open s :=
sorry

theorem exercise_13_3a {α : Type u} ( : set (set α)) (hc : is_countable_cofiltered c) (hX : ∀ (s : set α), s ∈ c → s.countable ∨ s = ⊤) : topological_space.generate_from c = c :=
sorry

theorem exercise_13_3b {X : Type*} [topological_space X] (U : set X) : ¬nhds alexandroff.infty U = ⊥ ∨ (∀ (x : X), x ∈ U → (∃ (n : ℕ), x = alexandroff.infty ^ n)) ∨ ∀ (x : X), x ∈ U → (∃ (n : ℕ), x = alexandroff.infty ^ n) :=
sorry

theorem exercise_13_4a1 {α : Type u} {ι : Sort v} (f : ι → topological_space.generate_from α) : (⨅ (i : ι), f i).is_top :=
sorry

theorem exercise_13_4a2 {α : Type u} {ts : set (topological_space α)} (h : ∀ (t : topological_space α), t ∈ ts → is_topological_space.separable t.carrier t.snd) [encodable ts] : ¬has_continuous_supr ts :=
sorry

theorem exercise_13_4b1 {α : Type u} {T : α → topological_space α} (h : ∀ (s : set (set α)), T s = topological_space.generate_from s) : T = topological_space.generate_from (set.range T) :=
sorry

theorem exercise_13_4b2 {α : Type u} {ι : Sort w} {t : ι → topological_space α} (h : ∀ (i : ι), topological_space.is_topological_space α) : topological_space.ext t :=
sorry

theorem exercise_13_5a {α : Type u} {s : set (set α)} (hs : topological_space.is_topological_basis s) : topological_space.generate_from s = ⨅ (t : topological_space α) (H : t ∈ s), topological_space.generate_from t :=
sorry

theorem exercise_13_5b {α : Type u} (s : set (set α)) : topological_space.generate_from s = ⋂ (t : topological_space α) (h : s ⊆ t), t :=
sorry

theorem exercise_13_6 {K : Type*} [category_theory.field K] [category_theory.preadditive K] (l : list (topological_space.opens K)) : ¬discrete_topology ↥(l.to_finset) :=
sorry

theorem exercise_13_8a {a : ℝ} (h : a < 0) : (nhds 0).has_basis (λ (b : ℝ), b < a ∧ a < b) (λ (b : ℝ), {b : ℝ | b < a}) :=
sorry

theorem exercise_13_8b {a b : ℝ} (h : a < b) : (nhds 0).has_basis (λ (ε : ℝ), 0 < ε) (λ (ε : ℝ), {p : ℝ × ℝ | p.fst < ε.snd}) :=
sorry

theorem exercise_16_1 {α : Type u} {p : α → Prop} : inducing p :=
sorry

theorem exercise_16_4 {α β : Type*} [topological_space α] [topological_space β] {f : α → β} : is_open_map f → is_open_map (prod.map f f) :=
sorry

theorem exercise_16_6 {a b c d : ℝ} (h : a < b ∧ c < d) (h' : a ≠ 0 ∧ b ≠ 0 ∧ c ≠ 0 ∧ d ≠ 0) : topological_space.is_topological_basis {p : ℝ × ℝ | a < p.fst ∧ c < p.snd} :=
sorry

theorem exercise_17_4 {α : Type u} [topological_space α] [add_group α] [topological_add_group α] {s t : set α} (hs : is_open s) (ht : is_closed t) : is_open (s - t) :=
sorry

theorem exercise_18_13 {α : Type*} [topological_space α] {A X Y : Type*} [topological_space A] [topological_space X] [topological_space Y] [t2_space Y] (f : C(A, Y)) (h : ∀ (x : A), ⇑f x ∈ closure A) (g : C(A, Y)) (hg : ∀ (x : A), ⇑g x ∈ closure A) : g = f.extend h :=
sorry

theorem exercise_18_8a {α : Type u} {β : Type v} [topological_space α] [preorder α] [t : order_closed_topology α] [topological_space β] {f g : β → α} (hf : continuous f) (hg : continuous g) : is_closed {b : β | f b ≤ g b} :=
sorry

theorem exercise_18_8b {α : Type u} {β : Type v} [topological_space α] [linear_order α] [order_closed_topology α] [topological_space β] {f g : β → α} (hf : continuous f) (hg : continuous g) (h : β → α) (hh : continuous h) : continuous (λ (x : β), linear_order.min (f x) (g x)) :=
sorry

theorem exercise_19_6a {α : Type*} [comm_pi_class α] {x : ℕ → α} {f : filter ℕ} : filter.tendsto (λ (n : ℕ), pi_nat.cylinder (x n) (f n)) filter.at_top (nhds (pi_nat.cylinder x f)) ↔ filter.tendsto (λ (n : ℕ), f n.succ) filter.at_top (nhds (pi_nat.cylinder x f)) :=
sorry

theorem exercise_20_2 {α β : Type*} [topological_space α] [measurable_space α] [opens_measurable_space α] [topological_space β] [measurable_space β] [borel_space β] : measurable_space.metrizable_space (α × β) :=
sorry

theorem exercise_21_6a {X : Type*} [topological_space X] {n : ℕ} {f : fin (n + 1) → X} {x₀ x₁ : X} (p : path (f 0) x₀ x₁) : filter.tendsto f (nhds x₀) (nhds x₁) :=
sorry

theorem exercise_21_6b {α β : Type*} [uniform_space α] [group α] [uniform_group α] {f : ℕ → β} {s : set β} (n : ℕ) : tendsto_uniformly_on (λ (x : β), x ^ n) f s :=
sorry

theorem exercise_21_8 {α β ι : Type*} [uniform_space β] {F : ι → α → β} {f : α → β} {x : filter α} {p : filter ι} (h : tendsto_uniformly F f p) (hf : ∀ (n : ι), continuous (F n)) (hx : filter.tendsto x filter.at_top (nhds x)) : filter.tendsto (λ (n : ι), F n (x n)) filter.at_top (nhds (f x)) :=
sorry

theorem exercise_22_2a {α β : Type*} [topological_space α] [topological_space β] (p : C(α, β)) (hp : continuous ⇑p) : quotient_map p :=
sorry

theorem exercise_22_2b {C : Type u} [category_theory.category C] (A X : Top) (r : X ⟶ A) (h : ∀ (a : ↥A), ⇑(Top.presheaf.pushforward C r) a = a) : category_theory.presheaf.is_quotient (Top.presheaf.rng A X) :=
sorry

theorem exercise_22_5 {α β : Type*} [topological_space α] [topological_space β] {p : α → β} (h : is_open_map p) (hp : is_open_map (set.cod_restrict p (set.range p))) : is_open_map (set.cod_restrict p (set.range p)) :=
sorry

theorem exercise_23_11 {α : Type u} {β : Type v} [topological_space α] [topological_space β] {p : α → β} (y : β) (h : ∀ (s : set β), is_connected s → is_connected (p ⁻¹' s)) (h' : is_connected β) : is_connected s :=
sorry

theorem exercise_23_2 {α : Type u} {β : Type v} [topological_space α] [linear_order β] [succ_order β] [is_succ_archimedean β] {s : β → set α} (H : ∀ (n : β), is_connected (s n)) (K : ∀ (n : β), (s n ∩ s (order.succ n)).nonempty) : is_connected (⋃ (n : β), s n) :=
sorry

theorem exercise_23_3 {α : Type u} {β : Type v} [topological_space α] [nonempty β] {s : set β} {f : β → set α} (hs : is_connected (f '' s)) (h : ∀ (b : β), b ∈ s → (f b).nonempty) : is_connected (s ∪ ⋃ (b : β) (H : b ∈ s), f b) :=
sorry

theorem exercise_23_4 {α : Type u} [topological_space α] {s : set α} (h : s.infinite) : is_connected s :=
sorry

theorem exercise_23_6 {α : Type u} [topological_space α] {s : set α} (h : is_connected (interior s)) (h' : ∀ (C : set α), C ⊆ s → (∃ (a : α) (H : a ∈ s), C = set.Ici a)) : interior s ∩ (closure s ∩ C) = C :=
sorry

theorem exercise_23_9 {α : Type u} {β : Type v} [topological_space α] [topological_space β] {s : set α} {t : set β} (hs : is_connected s) (ht : is_connected t) (h : (s ×ˢ t).nonempty) : is_connected (s ×ˢ t) :=
sorry

theorem exercise_24_2 {α : Type*} [topological_space α] {β : Type*} [topological_space β] [compact_space α] (f : C(α, β)) : ∃ (x : α), ⇑f x = ⇑f (-x) :=
sorry

theorem exercise_24_3a {α : Type u} [topological_space α] {f : α → α} (hf : continuous f) [t2_space α] (h : ∀ (x : α), x = 1 → (∃ (y : α), f y = x)) (a : α) : ∃ (x : α), f x = a :=
sorry

theorem exercise_25_4 {X : Type*} [topological_space X] [locally_path_connected_space X] {U : set X} (hU : is_open U) (h : ∀ (V : set X), V ∈ nhds_within 0 (set.Ioi 0) → is_open V) : is_path_connected U :=
sorry

theorem exercise_25_9 {G : Type*} [group G] [topological_space G] [topological_group G] {C : set G} (hC : is_normal_subgroup C) (hCone : C = ⊤) : C.normal :=
sorry

theorem exercise_26_11 {α : Type u} [topological_space α] [t2_space α] [compact_space α] (s : set (set α)) (hs : s.ord_connected) (hne : ∀ (t : set α), t ∈ s → is_closed t) (hfin : ∀ (t : set α), t ∈ s → t.nonempty) : is_connected (⋂₀ s) :=
sorry

theorem exercise_26_12 {α β : Type*} [topological_space α] [uniform_space β] {p : C(α, β)} (hp : is_closed {x : α | is_compact {y : β | p y x}) (hsurj : closed_continuous_map p) (h : ∀ (y : β), is_compact {x : α | p x y}) : compact_space α :=
sorry

theorem exercise_27_4 {X : Type*} [metric_space X] [connected_space X] [nonempty X] : ¬metric_space.uncountable_of_one_point X :=
sorry

theorem exercise_28_4 (α : Type u) [topological_space α] : topological_space.compact_space α ↔ ∀ (s : topological_space.opens α), s.countable → (∃ (t : topological_space.compact_covering α), s ⊆ t.carrier ∧ t.finite) :=
sorry

theorem exercise_28_5 {α : Type u} [topological_space α] : compact_space α ↔ ∀ (C₁ C₂ : set (set α)), is_closed C₁ → is_closed C₂ → C₁ ⊆ C₂ → (∃ (h₁ : C₁ ⊆ C₂), (∀ (h₂ : C₂ ⊆ C₁), h₂ ∈ C₁ → h₁ ∈ C₂) ∧ C₁.nonempty) :=
sorry

theorem exercise_28_6 {α : Type u} [metric_space α] {f : α → α} (hf : ∀ (x y : α), has_dist.dist (f x) (f y) = has_dist.dist x y) (s : topological_space.compacts α) : (isometry_of_condition_compacts f hf s).to_equiv = equiv.of_injective f _ :=
sorry

theorem exercise_29_1 : ¬locally_compact_space ℚ :=
sorry

theorem exercise_29_10 {α : Type u} [topological_space α] [locally_compact_space α] {x : α} {U : set α} (hU : U ∈ nhds x) : ∃ (V : set α) (H : V ∈ nhds x), closure V ⊆ U ∧ is_compact (closure V) :=
sorry

theorem exercise_29_4 {α : Type*} [topological_space α] [omega_complete_space α] [topological_space.separable_space ↥(set.Icc 0 1)] : ¬measure_theory.locally_compact_space ↥(set.Icc 0 1) :=
sorry

theorem exercise_30_10 {α β : Type*} [topological_space α] [topological_space β] {s : set (set α)} (hs : dense s) (h : ∀ (t : set α), t ∈ s → t.countable) : dense s :=
sorry

theorem exercise_30_13 (X : Top) [category_theory.category X] [category_theory.limits.has_countable_dense_set X] (U : set (topological_space.opens ↥X)) : (∀ (V : topological_space.opens ↥X), V ∈ U → disjoint V U) → U.countable :=
sorry

theorem exercise_31_1 : Type*} [topological_space X] [regular_space X] {x y : X} : disjoint (closure (set.range (λ (p : X × X), p.fst ^ p.snd)) (x, y)) :=
sorry

theorem exercise_31_2 {α : Type u} [topological_space α] [normal_space α] (hd : ∀ (s t : set α), is_closed s → is_closed t → disjoint s t) : disjoint (closure s) (closure t) :=
sorry

theorem exercise_31_3 {α : Type*} [preorder α] (f : order_topology α) : f.is_regular :=
sorry

theorem exercise_32_1 (𝕜 E : Type*) [normed_field 𝕜] [add_comm_group E] [module 𝕜 E] [topological_space E] [has_continuous_smul 𝕜 E] [t2_space E] : normal_space (submodule 𝕜 E) :=
sorry

theorem exercise_32_2a {α : Type u} [emetric_space α] (H : ∀ (s : set α), s.nonempty → emetric.Hausdorff_edist s ≠ ⊤) (a : α) : (emetric.Hausdorff_edist a).nonempty :=
sorry

theorem exercise_32_2b {η X : η → Type*} [Π (i : η), nonempty (X i)] (h : is_regular (Π (i : η), X i)) : is_regular (Π (i : η), X i) :=
sorry

theorem exercise_32_2c {X : ℝ → Type*} (hX : (hyperreal.of_real X).is_normal) : (hyperreal.of_real X).nonempty :=
sorry

theorem exercise_32_3 (X : Type*) [topological_space X] [locally_compact_space X] [t2_space X] : ∃ (n : ℕ), regular_space.core.nth X n :=
sorry

theorem exercise_33_7 (X : Type*) [topological_space X] [locally_compact_space X] [t2_space X] : is_totally_regular X :=
sorry

theorem exercise_33_8 {X : Type*} [topological_space X] [complete_space X] {A B : set X} (hA : is_closed A) (hB : is_closed B) (hAB : disjoint A B) (hX : is_compact A) : ∃ (f : C(X, ℝ)), set.eq_on ⇑f 0 A ∧ set.eq_on ⇑f 1 B ∧ ∀ (x : X), ⇑f x ∈ set.Icc 0 1 :=
sorry

theorem exercise_34_9 {X : Type*} [topological_space X] [compact_space X] [t2_space X] [topological_space.metrizable_space X] (hX : ∃ (n : ℕ), topological_space.is_metrizable_of_compact X n) : topological_space.metrizable_space X :=
sorry

theorem exercise_38_6 {α : Type u} [topological_space α] [t2_space α] [regular_space α] : connected_space stone_cech ↔ connected_space α :=
sorry

theorem exercise_43_2 {α : Type u} {β : Type v} [metric_space α] [metric_space β] {Y : Type v} [metric_space Y] [complete_space Y] {A : set α} {f : α → β} (hf : uniform_continuous f) (h : ∀ (x : α), x ∈ A → (∃ (y : β), filter.tendsto f (filter.principal A) (nhds y))) : ∃ (g : α → β), continuous g ∧ uniform_continuous g :=
=======
is_open_of_forall_open_subset {α : Type u} [topological_space α]
	[t0_space α] {s : set α} (h : ∀ (x : α), x ∈ s → (∃ (t : set α) (H : t ⊆ s), is_open t ∧ x ∈ t)) :
	is_open s :=
sorry

is_open_of_countable_disjoint_subtype {α : Type u}
	{s : set (set α)} [t : set α] (hs : s.countable)
	(hd : ∀ (t : set α), t ⊆ s → is_open t) :
	is_open s :=
sorry

alexandroff.nhds_infty_eq_bot {X : Type*} [topological_space X] :
	nhds alexandroff.infty = ⊥ :=
sorry

topological_space.is_topological_infi_of_cover {α : Type u}
	{ι : Sort w} {t : ι → topological_space α} {f : α → set α}
	(h : ∀ (i : ι), topological_space.is_topological_basis (f i)) :
	topological_space.is_topological_basis (⋂ (i : ι), f i) :=
sorry

not_nonempty_of_is_topological_space {α : Type u}
	[topological_space α] [h : nonempty α] {f : set α} :
	¬is_topological_space f :=
sorry

generate_from_eq_of_unique_topology {α : Type u}
	{t : set (set α)} (h : t.is_open) :
	∃! (s : set (set α)), s = {t : set α | t.is_open s} :=
sorry

generate_from_eq_of_unique_topology {α : Type u}
	{t : set (set α)} (h : t = topological_space.generate_from (set.range (λ (s : set α), s)))
	(h_eq : ∀ (s : set α), s ∈ t → is_open s) :
	topological_space.generate_from t = t :=
sorry

nhds_basis_infi {α : Type u} {ι : Sort w} [topological_space α]
	{p : ι → Prop} {s : ι → set α} (h : (nhds 0).has_basis p s) :
	(nhds 0).has_basis p (λ (i : ι), ⋂ (hi : p i), s i) :=
sorry

le_generate_from_of_subbasis {α : Type u} {s : set (set α)}
	(hs : s.finite) :
	topological_space.generate_from s ≤ topological_space.generate_from s :=
sorry

R_or_C.not_disjoint {K : Type*} [topological_space K] {l : list R} :
	¬disjoint l (R_or_C.obj K) :=
sorry

rat.basis_of_basis_of_dense {α : Type*} [linear_ordered_field α]
	[archimedean α] (p : α → Prop) (h_gen : ∀ (a : α), p a → p (order.pred a))
	(h_dense : ∀ (a : α), p a → p (order.pred a)) (a : α) :
	p a :=
sorry

rat.nhds_basis_strict {α : Type*} [linear_ordered_field α]
	[topological_space α] [order_topology α] [no_min_order α] [no_max_order α]
	(a : α) :
	(nhds a).has_basis (λ (b : α), a < b) (λ (b : α), {b : α | a < b}) :=
sorry

nhds_subtype_coe_subtype {α : Type u} {β : Type v} [topological_space α]
	{p : β → Prop} [Π (x : β), decidable (p x)] (a : subtype p) :
	nhds a = filter.comap coe (nhds ↑a) :=
sorry

is_open_map_prod_mk {α : Type u} {β : Type v} [topological_space α]
	[topological_space β] {f : α → β} :
	is_open_map f ↔ ∀ (s : set α), is_open s → is_open (f '' s) :=
sorry

real.mk_basis_Ioo_Ioo_Ioo_Ioo_Ioo_Ioo_Ioo_Ioo_Ioo_Ioo_I
	{ι : Type u} [hι : nonempty ι] {a b c d : ℝ} (h : a < b) (h' : c < d)
	(hab : a ≠ b) (hcd : c ≠ d) :
	(real.mk_basis ↥(set.Ioo a b) (set.Ioo c d)).has_basis (λ (x : ℝ × ℝ), x.fst < a.fst ∧ x.snd < c.fst) (λ (x : ℝ × ℝ), x.fst.fst) ∧ set.Ioo a.fst b.fst ∩ set.Ioo c.fst d.fst = set.Ioo (a.snd_1) (b.snd_1) :=
sorry

is_open.sub_mem {α : Type u} [topological_space α] [add_group α]
	[topological_add_group α] {U A : set α} (hU : is_open U) (hA : A ∈ nhds 0) :
	U - A ∈ nhds 0 :=
sorry

continuous_map.extend_unique {α β : Type*} [topological_space α]
	[topological_space β] [t2_space β] {A : set α} {f : C(α, β)}
	{Y : Type*} [topological_space Y] [t2_space Y] (h : continuous f)
	(g : C(α, β)) (hg : continuous g) :
	g = h.extend f :=
sorry

continuous.le_closed_property {α : Type u} {β : Type v}
	[topological_space α] [linear_order α] [order_closed_topology α]
	[topological_space β] [preorder β] [order_closed_topology β] {f g : α → β}
	(hf : continuous f) (hg : continuous g) :
	continuous (λ (x : α), f x ≤ g x) :=
sorry

continuous.min {α : Type u} {β : Type v} [topological_space α]
	[linear_order α] [order_closed_topology α] {f g : α → β} [topological_space β]
	(hf : continuous f) (hg : continuous g) (h : α → β) (h0 : 0 < h 0)
	(hle : ∀ (x : α), f x ≤ h x) (hle' : ∀ (x : α), g x ≤ h x) :
	continuous (λ (x : α), linear_order.min (f x) (g x)) :=
sorry

pi_nat.tendsto_cylinder_iff {ι π : ι → Type*} [fintype ι]
	[Π (i : ι), topological_space (π i)] {l : filter ι} {x₁ x₂ : Π (i : ι), π i}
	{f : Π (i : ι), π i} :
	filter.tendsto f l (nhds (x₁ x₂)) ↔ ∀ (i : ι), filter.tendsto (λ (a : Π (i : ι), π i), f i a) l (nhds (x₁ i)) :=
sorry

real.mul_self_topology_of_nhds_zero {x : ℝ} (hx : nhds x = ⊤) :
	(nhds x).mul_self < ⊤ :=
sorry

tendsto_pow_of_tendsto_nhds_within {𝕜 : Type*}
	[linear_ordered_field 𝕜] [topological_space 𝕜] [order_topology 𝕜] {n : ℕ}
	{f : fin n → 𝕜} {a : 𝕜}
	(hf : ∀ (i : fin n), filter.tendsto f (nhds_within i (set.Ici i)) (nhds a)) :
	filter.tendsto (λ (x : 𝕜), x ^ n) (nhds_within a (set.Ici a)) :=
sorry

tendsto_pow_neg_nhds_within_Ici_of_neg_aux {𝕜 : Type u}
	[linear_ordered_field 𝕜] [topological_space 𝕜] [order_topology 𝕜]
	[topological_ring 𝕜] {a : 𝕜} {n : ℕ} {f : fin n → 𝕜} {s : set 𝕜}
	(h : ∀ (i : fin n), -f i ∈ nhds_within a s) :
	filter.tendsto (λ (x : 𝕜), x ^ -n) filter.at_top (nhds_within (-a) s) :=
sorry

continuous_map.tendsto_of_tendsto_uniformly_of_tendsto_uniformly
	{α : Type*} [topological_space α] {β : Type*} [metric_space β] {ι : Type*}
	{F : ι → C(α, β)} {f : C(α, β)} {x : filter α}
	(h : tendsto_uniformly F f x) (hx : filter.tendsto x F filter.at_top) :
	filter.tendsto (λ (n : ι), ⇑(F n)) x (nhds (⇑f x)) :=
sorry

continuous_map.quotient_of_exists_quotient_map {α β : Type*}
	[topological_space α] [topological_space β] (p : α → Prop) (f : C(β, α))
	(h : ∃ (a : α), p (⇑f a)) :
	quotient_map p :=
sorry

continuous_map.quotient_mk_of_is_quotient_mk {α : Type*}
	[topological_space α] {A : set α} (r : α → α → Prop) [t2_space α]
	[is_refl α r] (h : ∀ (a : α), r a a) :
	⟦A⟧ = A :=
sorry

is_open_map.of_open_map {α β : Type*} [topological_space α]
	[topological_space β] {p : α → Prop} (h : is_open_map p) (hp : is_open_map p) :
	is_open_map (λ (a : α), q) :=
sorry

quotient_map.connected_preimage_of_preimage_connected_space {α : Type u}
	{β : Type v} [topological_space α] [topological_space β] {p : α → Prop}
	(h : ∀ (a : α), p a → is_connected (set.range p))
	(h' : ∀ (a : β), is_connected (set.range p)) :
	connected_space α :=
sorry

is_connected.Union_of_nonempty_inter_connected {α : Type u}
	[conditionally_complete_linear_order α] [topological_space α]
	[order_topology α] {s : set α} (H : s.nonempty)
	(K : ∀ (n : ℕ), is_connected (s ∩ set.Ico n (order.succ n))) :
	is_connected (⋃ (n : ℕ), s) :=
sorry

is_connected.union_nonempty_of_nonempty_connected_subspace {α : Type u}
	[topological_space α] {s : set α} (h : is_connected s)
	(h' : ∀ (t : set α), is_connected t → (s ∩ t).nonempty → (s ∩ t).nonempty) :
	is_connected (s ∪ ⋃ (t : set α) (H : t ∈ s), t) :=
sorry

finite_compl_topology_of_infinite {α : Type u} [infinite α] :
	topological_space.finite_compl ⊤ :=
sorry

is_connected.intermediate_value {α : Type u} [pseudo_emetric_space α]
	{s : set α} (hs : is_connected s) (h's : sᶜ ∩ s) :
	is_connected s :=
sorry

is_connected.from_prod_mk_of_is_connected_aux {α : Type u} {β : Type v}
	[topological_space α] [topological_space β] {s : set α} {t : set β}
	(hs : is_connected s) (ht : is_connected t) (hst : s ×ˢ t ⊆ s)
	(h : is_connected (s ×ˢ t)) :
	is_connected (s ×ˢ t) :=
sorry

circle_deg1_lift.continuous_map_apply (f : circle_deg1_lift)
	(x : ℝ) :
	⇑f x = ⇑f (-x) :=
sorry

continuous_map.coe_mk {α : Type*} [topological_space α]
	(f : C(α, α)) (h₁ : f 1 = 1) (h₂ : ∀ (x : α), ⇑f x = x)
	(h₃ : ∀ (x y : α), ⇑f x = ⇑f y ↔ x = y) :
	⇑{to_continuous_map := f, continuous_to_fun := h₁, continuous_inv_fun := h₂, continuous_inv_fun := h₃} = f :=
sorry

loc_path_connected.assert {X : Type*} [topological_space X]
	[loc_path_connected_space X] {s : set X} (hs : is_connected s) :
	loc_path_connected s :=
sorry

is_normal_subgroup_of_is_open_of_mem_nhds_one {G : Type*} [group G]
	[topological_space G] [has_continuous_mul G] {e : G}
	(he : e ∈ nhds 1) :
	is_normal_subgroup (is_open_of_mem_nhds 1) :=
sorry

is_connected_Inter_of_open_of_lt_of_nonempty {α : Type u}
	[topological_space α] [compact_space α] [nonempty α] {s : set α}
	(hs : ∀ (a : α), a ∈ s → is_connected a) :
	is_connected (⋂ (a : α) (H : a ∈ s), s) :=
sorry

is_compact_of_surjective_compact_of_is_compact_of_is_compact_of_is_compact_of_surjective
	{α : Type u} {β : Type v} [topological_space α] [topological_space β]
	{p : α → Prop} {f : β → α} (hf : is_closed_map f) (hf' : p ∘ f)
	(hf : is_compact_of_surjective f) (h : ∀ (y : β), p (f y)) :
	is_compact_space α :=
sorry

is_connected.exists_is_greatest_of_succ_le {α : Type u}
	[conditionally_complete_linear_order α] [topological_space α]
	[order_topology α] [densely_ordered α] {s : set α} (h : is_connected s) :
	∃ (x : α), is_greatest s x :=
sorry

first_order.language.Theory.model_countable_compact_convergence
	{L : first_order.language} {X : Type w} [L.Structure X]
	[topological_space X] [topological_space.second_countable_topology X] :
	(∀ (f : L.functions (fin (X ⊕ fin 1)), X ⊕ {f // f.finite}) → (∃ (T : L.Theory), T ∈ f ∧ ↑T = set.univ) ∧ L.countable_compact_convergence.to_Lhom T) :=
sorry

emetric.nonempty_inter_of_directed_on {α : Type u}
	[pseudo_emetric_space α] [nonempty α] {s : set α} :
	(∀ (C : ennreal), (∀ (x : α), x ∈ s → C ≤ x) → (∃ (t : set α) (H : t ∈ s), (∀ (z : α), z ∈ t → z ∈ s) ∧ ∀ (z : α), z ∈ t → (∃ (y : α) (H : y ∈ s), y ∈ t)) :=
sorry

isometric.of_compact_to_equiv {α : Type u} [pseudo_emetric_space α]
	(h : ∀ (x y : α), has_dist.dist (⇑h x) (⇑h y) = has_dist.dist x y) :
	isometric.of_compact (isometric.of_equiv h) :=
sorry

rat.not_locally_compact_of_not_locally_compact_ℚ :
	¬locally_compact_space ℚ :=
sorry

exists_nhds_locally_compact_subset {α : Type u} [topological_space α]
	[locally_compact_space α] (x : α) :
	∃ (s : set α) (H : s ∈ nhds x), is_compact s ∧ is_open s ∧ x ∈ s :=
sorry

continuous_map.not_locally_compact_mem_uniformity (α : Type*)
	[topological_space α] [compact_space α] :
	continuous_map.compact_mem_uniformity α :=
sorry

dense_pi_system_of_countable {α : Type*} [topological_space α]
	[nonempty α] {s : set (set α)} (hs : (set.univ.pi s).nonempty)
	(hd : ∀ (t : set α), t ∈ s → t.nonempty → is_open t) :
	dense s :=
sorry

dense.countable_disjoint_open {α : Type u} [topological_space α]
	{s : set α} (hs : dense s) :
	∃ (t : set α), s ⊆ t ∧ t.countable ∧ disjoint t :=
sorry

is_regular_of_disjoint_of_singleton_of_regular {X : Type*}
	[topological_space X] [t0_space X] :
	is_regular {x : X | disjoint {x} {x} :=
sorry

normal_pairwise_disjoint {α : Type*} [topological_space α]
	[normal_space α] :
	normal_pairwise (λ (s t : set α), s ∩ t) :=
sorry

is_regular_of_order_topology {α : Type u} [topological_space α]
	[partial_order α] [order_topology α] :
	is_regular (set.range coe) :=
sorry

normal_subtype_normal {α : Type*} [topological_space α]
	[normal_space α] {p : α → Prop} :
	normal_subtype p → (normal_subtype p).normal :=
sorry

is_Hausdorff.nonempty {α : Type u} [topological_space α]
	{s : set α} (hs : is_Hausdorff s) :
	s.nonempty :=
sorry

is_regular_of_nonempty_pi {α : Type*} [topological_space α]
	{π : α → Type*} {s : Π (a : α), set (π a)} (h : is_regular (s π)) :
	is_regular (s π) :=
sorry

nonempty_pi_lift_of_eval_nonempty {ι : Type*} (α : ι → Type*)
	[Π (i : ι), nonempty (α i)] :
	(nonempty (Π (i : ι), α i)).lift :=
sorry

loc_compact_is_regular_of_locally_compact_space {α : Type u}
	[topological_space α] [locally_compact_space α] :
	is_regular (locally_compact_space α) :=
sorry

loc_compact_t2_of_locally_compact_space {X : Type*}
	[topological_space X] [t2_space X] {f : X → X} :
	locally_compact_space X → (∃ (c : X) (H : c ∈ nhds f), ∀ (x : X), x ∈ f c → (∃ (y : X) (H : y ∈ set.Icc (f c) (f x)), y ∈ set.Icc (f c) (f x)) :=
sorry

continuous_map.compact_open_of_disjoint_closed_compact_of_continuous_of_le
	{X : Type*} [topological_space X] [topological_space.separable_space X]
	{A B : set X} (hA : is_compact A) (hB : is_closed B) (h : A ⊆ B)
	(hA₁ : ∀ (x : X), x ∈ A → ∀ (y : X), y ∈ B → f x = 0 → f y = 1)
	(hB₁ : ∀ (x : X), x ∈ B → f x ∈ continuous_map.compact_open A)
	(hB₂ : ∀ (x : X), x ∈ B → f x ∈ continuous_map.compact_open.gen A) :
	continuous_map.compact_open.of_compact_open hA₁ hB₁ ≤ continuous_map.compact_open.of_compact_open hA₂ hB₂ :=
sorry

compact_t2_of_is_compact_union_closed_subspaces {α : Type u}
	[topological_space α] [compact_space α] [t2_space α] {X : set α}
	(hX : is_compact X) (hX' : X ⊆ X) :
	is_metrizable X → is_compact_t2 X :=
sorry

urysohns.CU.exists_continuous_surjective_of_compact_open {X : Type*}
	[topological_space X] [normal_space X] [compact_space X] (β : urysohns.CU X) :
	∃ (x : X), continuous_map.surjective (λ (n : ℕ), urysohns.CU.approx n β x) :=
sorry

Profinite.is_connected_of_stone_cocompact {X : Profinite}
	(hX : category_theory.limits.has_products (forget ↥(X.to_CompHaus.to_Top)) (X.to_CompHaus.to_Top)) :
	category_theory.is_connected (Profinite.of_to_CompHaus.to_Top) :=
sorry

uniform_continuous.extend_of_complete {α : Type*} [uniform_space α]
	{β : Type*} [uniform_space β] {γ : Type*} [uniform_space γ] {δ : Type*}
	[complete_space δ] {f : α → γ} (hf : uniform_continuous f) {g : γ → δ}
	(hg : uniform_continuous g) :
	uniform_continuous (function.extend f g) :=
