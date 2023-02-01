import .common 

open complex filter function interval_integral
open_locale big_operators
open_locale filter
open_locale topological_space

universes u v 

theorem exercise_1_13a {f : ℂ → ℂ} {z : ℂ} (h : z.re = f) : f = function.const ℂ z :=
sorry

theorem exercise_1_13b {f : ℂ → ℂ} {s : set ℂ} (hs : is_open s) (hf : ∀ (z : ℂ), z ∈ s → z.im = x) : f = function.const ℂ s (f z) :=
sorry

theorem exercise_1_13c {f : ℂ → ℂ} {z : ℂ} (h : complex.abs f = z) : f = function.const ℂ z :=
sorry

theorem exercise_1_19a (𝕜 : Type*) [normed_field 𝕜] (z : ↥(metric.sphere 0 1)) : ¬summable_on 𝕜 (λ (x : ↥(metric.sphere 0 1)), ↑z ^ x) (metric.sphere 0 1) :=
sorry

theorem exercise_1_19b (z : ℂˣ) : has_sum (λ (x : ℝ), ↑x * ↑x - z * ↑z) (↑z * ↑z - z * ↑z) :=
sorry

theorem exercise_1_19c (z : ℂ) : (∀ (x : ℂ), x ∈ metric.sphere z |1| → z = 1) → summable (λ (x : ℂ), x * ↑(z.re) / ↑(z.im)) :=
=======
holor.cprank_max_1 {α : Type} {ds : list ℕ} [monoid α] [add_monoid α]
	{f : holor α ds} :
	holor.cprank_max 1 f → f.cprank_max :=
sorry

holor.cprank_max_1 {α : Type} {ds : list ℕ} [monoid α] [add_monoid α]
	{f : holor α ds} :
	holor.cprank_max 1 f :=
sorry

holor.cprank_max_nil {α : Type} {ds : list ℕ} [monoid α] [add_monoid α]
	{f : holor α ds} :
	holor.cprank_max 1 f → f.nil.cprank_max :=
sorry

power_series.not_summable_const_mul_pow {A : Type*} [comm_ring A]
	[algebra ℚ A] [topological_space A] [topological_ring A] (n : ℕ) :
	¬summable (λ (a : A), ↑n * a) :=
sorry

exp_series_summable_of_mem_circle {𝕂 𝔸 : Type*} [is_R_or_C 𝕂]
	[normed_ring 𝔸] [normed_algebra 𝕂 𝔸] [complete_space 𝔸] (n : ℕ) :
	summable (λ (x : 𝔸), ↑(n / ↑x)) :=
sorry

power_series.tendsto_nhds_one {E : Type*} [normed_group E]
	[normed_space ℝ E] [complete_space E] {f : power_series ℝ E} :
	filter.tendsto ⇑(power_series.nhds f) (nhds 1) :=
